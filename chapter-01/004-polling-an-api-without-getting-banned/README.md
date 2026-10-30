# 004. Polling an API without getting banned: OpenAQ /latest into Eventstream

Code from post 004 of the 365 days of Microsoft Fabric series, chapter 1: Definitions before demonstrations. The post publishes on t-sql.dk on Thursday 12 November 2026.

*Status: test plan with runnable code. The rate-limit headers and the shape of the `/latest` response have been confirmed against the live API. The worker below has not been run against Eventstream yet. The results of the first manual event and the first poll go into this post before it is published.*

Use the files in the order below, which is the order the post uses them.

| File | Runs in | Section in the post |
| --- | --- | --- |
| [`nb_004_openaq_latest_worker.ipynb`](nb_004_openaq_latest_worker.ipynb) | Fabric notebook (Python), 8 code cells | The worker |

Replace placeholders such as `<your-vault-name>` with your own values. Keys and secrets stay in Azure Key Vault; the post shows where each one comes from.
