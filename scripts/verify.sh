#!/bin/bash
set -e
set -u
set -o pipefail

# get input
eval "$(jq -r '@sh "MATCH=\(.match) ERROR=\(.error)"')"

if [[ "$MATCH" == "true" ]]; then
  # empty output
  jq -n '{}'
  exit 0
elif [[ "$MATCH" == "false" ]]; then
  >&2 echo "$ERROR"
  exit 1
else
  >&2 echo "Match should evaluate to true or false"
  exit 1
fi
