#!/usr/bin/env bash
set -e

echo "=== Project-EUCLID Git Upload ==="

# Verify we're in a git repo
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "ERROR: Not inside a Git repository."
    exit 1
fi

# Create standard directories
mkdir -p \
docs \
theory \
validation \
constitution \
references \
math \
experiments \
research \
simulations \
software \
hardware \
backlog

# Detect branch
BRANCH=$(git branch --show-current)

if [ -z "$BRANCH" ]; then
    BRANCH="master"
fi

echo "Current branch: $BRANCH"

# Show status
git status

# Stage everything
git add .

# Commit if needed
if git diff --cached --quiet; then
    echo "Nothing new to commit."
else
    git commit -m "Repository update $(date '+%Y-%m-%d %H:%M:%S')"
fi

# Ensure origin exists
if ! git remote get-url origin >/dev/null 2>&1; then
    echo
    echo "No remote named origin configured."
    echo "Add one with:"
    echo "git remote add origin https://github.com/<USER>/<REPO>.git"
    exit 1
fi

echo
echo "Pushing to origin/$BRANCH..."
git push -u origin "$BRANCH"

echo
echo "Done."
echo "Repository successfully synchronized."
