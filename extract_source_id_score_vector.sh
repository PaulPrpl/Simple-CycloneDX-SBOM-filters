#!/bin/bash
[[ $# -ne 1 && ! -r "$1" ]] && exit 2
jq ".vulnerabilities[] | {source: .source, id: .id, score: .ratings[] | select(.score != null) | .score,  vector: .ratings[] | select(.vector != null and .method == \"CVSSv3\") |  .vector}" "$1"
