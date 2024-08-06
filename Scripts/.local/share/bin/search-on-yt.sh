#!/bin/bash
URL="https://www.youtube.com/results?search_query=$@"
# xdg-open "$URL"
firefox --new-tab "$URL"
