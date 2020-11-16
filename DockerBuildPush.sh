#!/usr/bin/env bash

set -x

./fetchBin.sh
docker build . -t twosevenska/jmusicbot:latest
docker push twosevenska/jmusicbot:latest

ver=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest \
    | grep tag_name \
	| cut -d '"' -f 4)
docker tag twosevenska/jmusicbot:latest twosevenska/jmusicbot:$ver
docker push twosevenska/jmusicbot:$ver

rm build/*