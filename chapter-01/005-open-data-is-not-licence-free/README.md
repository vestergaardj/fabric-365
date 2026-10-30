# 005. Open data is not licence-free: reading the OpenAQ /licenses endpoint

Code from post 005 of the 365 days of Microsoft Fabric series, chapter 1: Definitions before demonstrations. The post publishes on t-sql.dk on Friday 13 November 2026.

*Status: runnable design. The license fields below have been confirmed against the live API. The notebook has not been run in my workspace yet. Its fixture test and the five governance checks run before a report relies on the result, and their output goes into this post before it is published.*

Use the files in the order below, which is the order the post uses them.

| File | Runs in | Section in the post |
| --- | --- | --- |
| [`nb_005_license_dimension.ipynb`](nb_005_license_dimension.ipynb) | Fabric notebook (Spark), 9 code cells | The notebook, to Five governance checks |

Replace placeholders such as `<your-vault-name>` with your own values. Keys and secrets stay in Azure Key Vault; the post shows where each one comes from.
