# `gcloud help`

This repo automatically scrapes the help text for [`gcloud`](https://cloud.google.com/sdk/) and puts it in this Git repo.

Scraping is automated with GitHub Actions.
Every day, the workflow installs the latest `gcloud` release, and crawls the output of `gcloud help` and all subgroups and subcommands.
The output is placed in [the `gcloud/` directory](./gcloud/).

This produces the same content as the [official CLI reference](https://cloud.google.com/sdk/gcloud/reference), in text form, with history.
This enables diffing the help text of two `gcloud` releases.

## How is this useful?

You can use this repo to identify changes in `gcloud` releases.

For example, compare [`374.0.0` and `375.0.0`](https://github.com/imjasonh/gcloud-help/compare/374.0.0..375.0.0) (looks like lots of help text formatting...).

GitHub also provides an undocumented RSS feed feature, which even lets you filter changes in certain paths.
For example, you can subscribe to [changes to the `gcloud builds` surface](https://github.com/imjasonh/gcloud-help/commits/main.atom?path=gcloud/builds) in your RSS reader of choice.
Party like it's 2009!

---

All text content is owned by Google, licensed under the [Creative Commons Attribution 4.0 License](https://creativecommons.org/licenses/by/4.0/).

Code in the repo is owned by me, licensed under the [Apache 2.0 license](https://www.apache.org/licenses/LICENSE-2.0).
