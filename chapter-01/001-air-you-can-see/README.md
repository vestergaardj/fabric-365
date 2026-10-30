# 001. Air you can see: the OpenAQ semantic model, star schema first

Code from post 001 of the 365 days of Microsoft Fabric series, chapter 1: Definitions before demonstrations. The post publishes on t-sql.dk on Monday 9 November 2026.

*Status: runnable design. The archive and pandas steps below have been run against the public OpenAQ files. The Fabric steps (Delta tables, semantic model and the three checks) have not been run in my workspace yet, and their output goes into this post before it is published.*

Use the files in the order below, which is the order the post uses them.

| File | Runs in | Section in the post |
| --- | --- | --- |
| [`nb_001_openaq_star_schema.ipynb`](nb_001_openaq_star_schema.ipynb) | Fabric notebook (Spark), 12 code cells | The notebook, to Three checks before any measure |

Replace placeholders such as `<your-vault-name>` with your own values. Keys and secrets stay in Azure Key Vault; the post shows where each one comes from.
