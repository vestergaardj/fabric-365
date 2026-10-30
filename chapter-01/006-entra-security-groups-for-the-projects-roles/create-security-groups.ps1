# Parameters
$tenantId       = "<your-tenant-id>"
$subscriptionId = "<your-subscription-id>"  # the subscription that holds the vault
$workspaceId    = "<workspace-id>"
$vaultName      = "<your-vault-name>"
$prefix         = "sg-fabric365"

$roles = [ordered]@{
    admins   = @{ Workspace = "Admin";       Vault = "Key Vault Secrets Officer"
                  Description = "Fabric 365 project: administers the workspace and its secrets" }
    builders = @{ Workspace = "Contributor"; Vault = "Key Vault Secrets User"
                  Description = "Fabric 365 project: builds notebooks, models and streams" }
    readers  = @{ Workspace = "Viewer";      Vault = $null
                  Description = "Fabric 365 project: reads reports and asks the agent" }
}

az login --tenant $tenantId
az account set --subscription $subscriptionId
$me = az ad signed-in-user show --query id -o tsv

$groupIds = @{}
foreach ($role in $roles.Keys) {
    $name = "$prefix-$role"
    $existing = @(az ad group list --filter "displayName eq '$name'" --query "[].id" -o tsv)
    if ($existing.Count -gt 1) { throw "More than one group is called $name. Remove the extra before going on." }
    if ($existing.Count -eq 1) {
        $groupIds[$role] = $existing[0]
        "Exists:  $name"
    } else {
        $groupIds[$role] = az ad group create --display-name $name --mail-nickname $name `
            --description $roles[$role].Description --query id -o tsv
        "Created: $name"
    }
}

foreach ($role in $roles.Keys) {
    $owners = @(az ad group owner list --group $groupIds[$role] --query "[].id" -o tsv)
    if ($owners -notcontains $me) {
        az ad group owner add --group $groupIds[$role] --owner-object-id $me
    }
}
$isMember = az ad group member check --group $groupIds["admins"] --member-id $me --query value -o tsv
if ($isMember -ne "true") {
    az ad group member add --group $groupIds["admins"] --member-id $me
}

$token = az account get-access-token --resource "https://api.fabric.microsoft.com" `
    --tenant $tenantId --query accessToken -o tsv
$headers = @{ Authorization = "Bearer $token" }
$uri = "https://api.fabric.microsoft.com/v1/workspaces/$workspaceId/roleAssignments"

$current = (Invoke-RestMethod -Uri $uri -Headers $headers).value
foreach ($role in $roles.Keys) {
    if ($current.principal.id -contains $groupIds[$role]) {
        "Already assigned: $prefix-$role"
        continue
    }
    $body = @{
        principal = @{ id = $groupIds[$role]; type = "Group" }
        role      = $roles[$role].Workspace
    } | ConvertTo-Json -Depth 3
    Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -Body $body `
        -ContentType "application/json" | Out-Null
    "Assigned $($roles[$role].Workspace) to $prefix-$role"
}
Remove-Variable token, headers

$vaultId = az keyvault show --name $vaultName --query id -o tsv
foreach ($role in $roles.Keys) {
    $vaultRole = $roles[$role].Vault
    if (-not $vaultRole) { continue }
    $assigned = @(az role assignment list --assignee $groupIds[$role] --scope $vaultId `
        --role $vaultRole --query "[].id" -o tsv)
    if ($assigned.Count -eq 0) {
        az role assignment create --assignee-object-id $groupIds[$role] `
            --assignee-principal-type Group --role $vaultRole --scope $vaultId --output none
        "Granted $vaultRole to $prefix-$role"
    }
}

az ad group list --filter "startswith(displayName,'$prefix-')" `
    --query "[].{name:displayName, security:securityEnabled, mail:mailEnabled}" -o table

$token = az account get-access-token --resource "https://api.fabric.microsoft.com" `
    --tenant $tenantId --query accessToken -o tsv
(Invoke-RestMethod -Uri $uri -Headers @{ Authorization = "Bearer $token" }).value |
    ForEach-Object { [pscustomobject]@{ Name = $_.principal.displayName; Type = $_.principal.type; Role = $_.role } } |
    Format-Table
Remove-Variable token

az role assignment list --scope $vaultId `
    --query "[].{principal:principalName, type:principalType, role:roleDefinitionName}" -o table
