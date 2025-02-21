#!/bin/bash
STATUS=$(playerctl -p spotify status 2>/dev/null) # Capture stderr to avoid "No players found" on stderr
if ! command -v "playerctl" &>/dev/null && ! command -v "sptlrx" &>/dev/null; then
  echo "Proper programs not installed!"
  exit
fi
if [ -z "$(ps aux | grep -v 'grep' | grep 'sptlrx pipe')" ]; then
  sptlrx pipe >>/tmp/lyrics-spt &
fi
# Script's logic
if [[ "$STATUS" == "No players found" ]]; then
  echo "No Spotify Player"
elif [ "$STATUS" == "Paused" ]; then
  echo "$(playerctl metadata title | cut -c -50)"
elif [ "$STATUS" == "Playing" ]; then
  if [ -s /tmp/lyrics-spt ]; then
    echo "$(tail -1 /tmp/lyrics-spt)"
  else
    echo "$(playerctl metadata title | cut -c -50)"
  fi
elif [[ -z "$STATUS" ]]; then
  :
else
  echo "Play Song"
fi
