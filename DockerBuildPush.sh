#!/usr/bin/env bash

set -x
set -o nounset # Exit script if you try to use an uninitialized variable
set -o errexit # Exit script if a statement returns a non-true return value
set -o pipefail # Use the error status of the first failure, rather than that of the last item in a pipeline

./fetchBin.sh
docker build . -t twosevenska/jmusicbot:latest
docker push twosevenska/jmusicbot:latest

ver=$(curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest \
    | grep tag_name \
	| cut -d '"' -f 4)
docker tag twosevenska/jmusicbot:latest "twosevenska/jmusicbot:$ver"
docker push "twosevenska/jmusicbot:$ver"

rm build/*