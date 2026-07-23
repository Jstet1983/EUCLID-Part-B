#!/usr/bin/env bash
set -e

echo "====================================="
echo " EUCLID Repository Validation"
echo "====================================="

echo
echo "[1/8] Checking Git repository..."
git status --short

echo
echo "[2/8] Checking required directories..."
for d in docs math papers experiments simulations references research .github; do
    if [ -d "$d" ]; then
        echo "✓ $d"
    else
        echo "✗ Missing: $d"
    fi
done

echo
echo "[3/8] Markdown files..."
find . -name "*.md" | sort

echo
echo "[4/8] Shell scripts..."
find . -name "*.sh" | sort

echo
echo "[5/8] Git branch..."
git branch

echo
echo "[6/8] Git remote..."
git remote -v

echo
echo "[7/8] Recent commits..."
git log --oneline -10

echo
echo "[8/8] Repository statistics..."
echo "Markdown: $(find . -name '*.md' | wc -l)"
echo "Shell:    $(find . -name '*.sh' | wc -l)"
echo "Folders:  $(find . -type d | wc -l)"

echo
echo "Validation complete."
