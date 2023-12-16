#!/bin/sh
# --span-hosts \
wget \
    --recursive \
    --level 3 \
    --page-requisites \
    --adjust-extension \
    --convert-links \
    --no-parent \
    $1
