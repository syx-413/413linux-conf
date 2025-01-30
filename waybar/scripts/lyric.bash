#!/bin/bash
# Simple script that determines what my polybar music module prints
# If spotify is playing it prints each lyric, if not then it prints
# last sources title
STATUS=$(playerctl -p spotify status 2>/dev/null) # Capture stderr to avoid "No players found" on stderr
# Check if programs installed
if ! command -v "playerctl" &>/dev/null && ! command -v "sptlrx" &>/dev/null; then
  echo "Proper programs not installed!"
  exit
fi
# Check if pipe is running
if [ -z "$(ps aux | grep -v 'grep' | grep 'sptlrx pipe')" ]; then
  sptlrx pipe >>/tmp/lyrics &
fi
# Script's logic
if [[ "$STATUS" == "No players found" ]]; then
  echo "No Spotify Player" # 显示更友好的消息
elif [ "$STATUS" == "Paused" ]; then
  echo "$(playerctl metadata title | cut -c -50)"
elif [ "$STATUS" == "Playing" ]; then
  if [ -s /tmp/lyrics ]; then # Check if /tmp/lyrics is not empty
    echo "$(tail -1 /tmp/lyrics)"
  else
    echo "$(playerctl metadata title | cut -c -50)" # 如果没有歌词，显示标题
  fi
elif [[ -z "$STATUS" ]]; then # Check if STATUS is truly empty (unlikely now with stderr redirection)
  :                           # Do nothing (no output). ":" is a null command.
else
  echo "Play Song" # 仍然保留，但不太可能被触发，除非 playerctl 返回其他意外状态
fi
