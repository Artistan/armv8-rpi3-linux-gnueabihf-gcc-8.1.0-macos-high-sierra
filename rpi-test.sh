#!/bin/bash

## test compile
x-tools/arm-rpi3-linux-gnueabihf/bin/arm-rpi3-linux-gnueabihf-gcc  -o test test.c

read -p 'rsync to server {pi@pi}: ' sync_to_user
if [[ ! "${sync_to_user}" ]]; then
    sync_to_user='pi@pi~/'
fi

rsync -rtzh test "${sync_to_user}:~/"
ssh "${sync_to_user}" "~/test"