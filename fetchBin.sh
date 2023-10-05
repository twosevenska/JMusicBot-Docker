#!/usr/bin/env bash

set -x
set -o nounset # Exit script if you try to use an uninitialized variable
set -o errexit # Exit script if a statement returns a non-true return value
set -o pipefail # Use the error status of the first failure, rather than that of the last item in a pipeline

if [ ! -d build ]; then
  mkdir build
fi

curl -s https://api.github.com/repos/twosevenska/MusicBot/releases/latest \
    | grep browser_download_url \
	| cut -d '"' -f 4 \
	| wget -qi - -O build/JMusicBot.jar