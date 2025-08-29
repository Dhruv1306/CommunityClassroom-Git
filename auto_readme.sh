#!/bin/bash

# ✅ Define which branches should trigger the README update
TARGET_BRANCHES=("master"mod_date=$(git log -1 --format="%ad" --date=short -- "$file") "main")

# Get current branch name
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check if current branch is in the target list
if [[ " ${TARGET_BRANCHES[@]} " =~ " ${CURRENT_BRANCH} " ]]; then
  echo "Updating README for branch: $CURRENT_BRANCH"

  echo "## 📜 File Timeline" > README.md
  echo "" >> README.md

  for file in $(ls *.txt | sort); do
    mod_date=$(git log -1 --format="%ad" --date=short -- "$file")
    echo "1. 🕰️ \`$file\` — updated on $mod_date" >> README.md
  done

  echo "" >> README.md
  echo "> Click on filenames to view contents." >> README.md
else
  echo "README update skipped — current branch '$CURRENT_BRANCH' not in target list."
fi
