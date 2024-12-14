#!/bin/bash
# Date = 04.26.20
# Edit = 12.08.24
# Leveraged some code from https://github.com/chall32/ROKU_restart.sh
# Tested on Roku Ultra & Roku Streaming Stick

ShowUsage() {
        echo "usage: $0 <ROKU IP>"
}

EXPECTED_ARGS=1
TARGET=$1
ROKUREBOOT=("home" "up" "right" "up" "right" "up" "up" "right" "select")
CMDTIMER=0.35

if [ $# -lt $EXPECTED_ARGS ]
then
        ShowUsage
        exit 1
fi

for i in $*
do
        case $i in
        --help)
                ShowUsage
                exit 1
        ;;
        esac
done

if [[ -n "$TARGET" ]]
then

        curl -d '' http://$TARGET:8060/keypress/home
        sleep 4

        for CMD in ${ROKUREBOOT[@]}
        do
                curl -d '' http://$TARGET:8060/keypress/$CMD
                sleep $CMDTIMER

        done

fi
