# 006. Entra security groups for the project's roles, so workspaces get groups and not people

Code from post 006 of the 365 days of Microsoft Fabric series, chapter 1: Definitions before demonstrations. The post publishes on t-sql.dk on Saturday 14 November 2026.

*Status: runnable design. The commands below have not been run in my tenant yet. Creating security groups needs a right that many organizations restrict, and the checkpoint output goes into this post before it is published.*

Use the files in the order below, which is the order the post uses them.

| File | Runs in | Section in the post |
| --- | --- | --- |
| [`create-security-groups.ps1`](create-security-groups.ps1) | PowerShell | The script, to Checkpoint |

Replace placeholders such as `<your-vault-name>` with your own values. Keys and secrets stay in Azure Key Vault; the post shows where each one comes from.
