# 003. Landing OpenAQ: S3 shortcut with an Entra service principal vs notebook copy

Code from post 003 of the 365 days of Microsoft Fabric series, chapter 1: Definitions before demonstrations. The post publishes on t-sql.dk on Wednesday 11 November 2026.

*Status: test plan with runnable code. The anonymous listing and download have been run against the public bucket. The Entra application, the AWS role, the Fabric connection and the comparison have not been run yet, and their results belong in this post before it is published.*

Use the files in the order below, which is the order the post uses them.

| File | Runs in | Section in the post |
| --- | --- | --- |
| [`create-entra-app.ps1`](create-entra-app.ps1) | PowerShell | Step 1: the Entra application |
| [`trust-policy.json`](trust-policy.json) | Read by `create-aws-role.sh` | Step 2: the AWS identity provider and role |
| [`s3-read-policy.json`](s3-read-policy.json) | Read by `create-aws-role.sh` | Step 2: the AWS identity provider and role |
| [`create-aws-role.sh`](create-aws-role.sh) | Bash | Step 2: the AWS identity provider and role |
| [`nb_003_land_openaq_archive.ipynb`](nb_003_land_openaq_archive.ipynb) | Fabric notebook (Spark), 4 code cells | Step 3: the connection and the shortcut, to Step 5: the comparison |

Replace placeholders such as `<your-vault-name>` with your own values. Keys and secrets stay in Azure Key Vault; the post shows where each one comes from.
