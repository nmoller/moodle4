#!/usr/bin/env bash

configFile="test.txt"

function clone() {
    echo "depot: $1; path: $2; branch: $3"
    git clone --branch $3 --single-branch $1 $2
    rm -rf $2/.git
}

while IFS= read -r line
do
  clone $line
done < "$configFile"