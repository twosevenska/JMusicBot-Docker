#!/usr/bin/env bash

curl -s https://api.github.com/repos/jagrosh/MusicBot/releases/latest \
    | grep browser_download_url \
	| cut -d '"' -f 4 \
	| wget -qi - -O build/JMusicBot.jar