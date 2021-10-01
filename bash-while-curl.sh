#!/usr/bin/env bash

SHELL_DIR=$(cd $(dirname $0) && pwd)
SELF=${BASH_SOURCE[0]##*/}

FILE_NAME='list.txt'

# コマンドが存在しないときの処理
if !(type "jq" > /dev/null 2>&1); then
  echo "${SELF} not executed!"
  exit 1
fi

# メイン処理
cat ${FILE_NAME} | while read URL
do
  curl -Ss ${URL} | jq .
  sleep 1
done

exit 0
