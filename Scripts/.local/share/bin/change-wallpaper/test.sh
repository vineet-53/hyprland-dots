#!/bin/bash

current_index=$(cat ./index.txt)
if [ "$current_index" == 1 ]; then
  echo "$((current_index + 1))" > index.txt
else
  echo "no"
fi
