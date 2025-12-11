#!/bin/bash

if [ ! -f checksum ]; then
    obc -w -o checksum checksum.mod
fi

if [ ! -f listcs ]; then
    obc -o listcs listcs.mod
fi

./checksum
./listcs

echo
echo "Pressione <Enter> para continuar. . ."
read

