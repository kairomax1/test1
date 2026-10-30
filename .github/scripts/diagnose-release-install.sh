#!/usr/bin/env bash
# Called by android-emulator-runner; keep the installer result for later steps.
set -u
apk=$(find apk -name '*_universal.apk' -print -quit)
output=$(adb install "$apk" 2>&1)
printf '%s\n' "$output"
if [[ "$output" == *"Success"* ]]; then
  result=SUCCESS
elif [[ "$output" =~ (INSTALL_[A-Z_]+) ]]; then
  result="${BASH_REMATCH[1]}"
else
  result=UNKNOWN_FAILURE
fi
printf 'INSTALL_RESULT=%s\n' "$result" >> "$GITHUB_ENV"
