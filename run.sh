#!/bin/bash
# vim: set ft=sh ff=unix fileencoding=utf-8 expandtab ts=2 sw=2 :
# ref. https://blog.kamipo.net/entry/2013/02/20/122225
#

if ! which python3 > /dev/null 2>&1; then
  echo 'requires `python3`'
  exit 1
fi

if ! which ngrok > /dev/null 2>&1; then
  echo 'requires `ngrok`'
  exit 1
fi

python3 -m http.server 5000 > /dev/null 2>&1 &
PYTHON_PID=$!

ngrok http 5000

# trap "kill $PYTHON_PID # kill python3" 1 2 3 15
# trap -p
kill $PYTHON_PID

