#!/bin/bash
URL="https://www.youtube.com/results?search_query=$1"
# xdg-open "$URL"
firefox --new-tab "$URL"
