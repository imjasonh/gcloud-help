# `gcloud help`

This repo automatically scrapes the help text for [`gcloud`](https://cloud.google.com/sdk/) and puts it in this Git repo.

Scraping is automated with GitHub Actions.
Every day, the workflow installs the latest `gcloud` release, and crawls the output of `gcloud help` and all subgroups and subcommands.
The output is placed in [the `gcloud/` directory](./gcloud/).

This produces the same content as the [official CLI reference](https://cloud.google.com/sdk/gcloud/reference), in text form, with history.
This enables diffing the help text of two `gcloud` releases.

---

All text content is owned by Google, licensed under the [Creative Commons Attribution 4.0 License](https://creativecommons.org/licenses/by/4.0/).

Code in the repo is owned by me, licensed under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).
