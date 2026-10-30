# fabric-365

Companion repository for the 365 days of Microsoft Fabric series on t-sql.dk: notebooks, pinned data and checkpoints for each chapter.

Every script in the series is here, in the folder of the post that uses it, so you can run the code without copying it from the page. The posts explain why each step is there.

## How to use it

- Fabric notebooks are `.ipynb` files. Import them into your workspace from the workspace toolbar, then attach the lakehouse the post names before you run anything.
- PowerShell, Bash and JSON files run on your own machine. Each post folder's README gives the order.
- Placeholders such as `<your-vault-name>` stand for your own values. No keys, secrets or IDs are stored here.
- A tag marks the end of each chapter (`chapter-01`, `chapter-02` and so on), so you can start any chapter from a known state.

## Chapters

| Chapter | Title | Posts |
| --- | --- | --- |
| [chapter-01](chapter-01) | Definitions before demonstrations | 001 to 007 |
