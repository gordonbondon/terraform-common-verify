#!/usr/bin/env sh

set -eu

get_value() {
  value=$(echo "${2}" | grep -o "\"${1}\":\"[^\"]*" | grep -o '[^"]*$')

  echo "${value}"
}

# get input
INPUT=$(cat)

MATCH=$(get_value "match" "${INPUT}")
ERROR=$(get_value "error" "${INPUT}")

if [ "$MATCH" = "true" ]; then
  # empty output
  echo '{}'
  exit 0
elif [ "$MATCH" = "false" ]; then
  >&2 echo "$ERROR"
  exit 1
else
  >&2 echo "Match should evaluate to true or false, got ${MATCH}"
  exit 1
fi
