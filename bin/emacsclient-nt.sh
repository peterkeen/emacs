#!/bin/sh

if [ ! $1 ]; then
    echo "Usage: emacsclien-nt.sh <filename>"
    exit 1
fi

emacsclient -nt $@