# 002. Meet the air quality data agent: scope, sources and the first ten questions

Code from post 002 of the 365 days of Microsoft Fabric series, chapter 1: Definitions before demonstrations. The post publishes on t-sql.dk on Tuesday 10 November 2026.

*Status: runnable design. The code below has not been run in my workspace yet. It needs the semantic model from post 001. The data agent SDK is in preview, and its tenant and capacity requirements will be checked again in the week before publication. The agent's first scored run is post 016.*

Use the files in the order below, which is the order the post uses them.

| File | Runs in | Section in the post |
| --- | --- | --- |
| [`nb_002_air_quality_agent.ipynb`](nb_002_air_quality_agent.ipynb) | Fabric notebook (Spark), 4 code cells | Descriptions are part of the interface, to Reference answers I can check by hand |

Replace placeholders such as `<your-vault-name>` with your own values. Keys and secrets stay in Azure Key Vault; the post shows where each one comes from.
