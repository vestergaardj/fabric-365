$appId = az ad app create --display-name "sp-fabric-openaq-s3" --query appId -o tsv
$spObjectId = az ad sp create --id $appId --query id -o tsv
$secret = az ad app credential reset --id $appId --years 1 --query password -o tsv
az keyvault secret set --vault-name "<your-vault-name>" --name "s3-shortcut-client-secret" --value $secret --output none
Remove-Variable secret
"Application (client) ID: $appId"
"Service principal object ID: $spObjectId"
