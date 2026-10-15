#!/usr/bin/env bash

printf '%s\n' "$1" | awk -F/ '{
    result = ""
    for (i = 2; i < NF; i++)
        result = result "/" substr($i, 1, 1)
    if (NF > 1)
        result = result "/" $NF
    print result == "" ? "/" : result
}'
