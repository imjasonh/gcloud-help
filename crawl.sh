#!/usr/bin/env bash

set -euo pipefail

path=$(pwd)/gcloud/$(printf "%s/" "$@")
mkdir -p $path

if [[ $# -eq 0 ]] ; then
  gcloud version > $(pwd)/gcloud/_version
  gcloud help > $(pwd)/gcloud/help
fi

groups=$(gcloud help $@ | go run ./ -print=groups)
commands=$(gcloud help $@ | go run ./ -print=commands)

for grp in $groups; do
	echo "$path$grp"
	mkdir -p $path/$grp
	gcloud help $@ $grp > $path/$grp/help
	./crawl.sh $@ $grp
done

for cmd in $commands; do
	echo "$path$cmd"
	gcloud help $@ $cmd > $path/$cmd
done
