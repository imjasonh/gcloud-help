#!/usr/bin/env bash

set -euxo pipefail

path=$(pwd)/gcloud/$(printf "%s/" "$@")
mkdir -p $path

if [[ $# -eq 0 ]] ; then
    gcloud version > version
fi

groups=$(gcloud help $@ | go run ./ -print=groups)
commands=$(gcloud help $@ | go run ./ -print=commands)

gcloud help > help

for grp in $groups; do
	mkdir -p $path/$grp
	gcloud help $@ $grp > $path/$grp/help
	./crawl.sh $@ $grp
done

for cmd in $commands; do
	gcloud help $@ $cmd > $path/$cmd
done
