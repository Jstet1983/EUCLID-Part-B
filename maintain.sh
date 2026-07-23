#!/usr/bin/env bash
set -e

echo "========== EUCLID Maintenance =========="

echo "[1] Repository Status"
git status

echo
echo "[2] Update TOC"
[ -f generate_toc.sh ] && ./generate_toc.sh || true

echo
echo "[3] Validate Repository"
[ -f validate_repo.sh ] && ./validate_repo.sh || true

echo
echo "[4] Stage Changes"
git add .

echo
echo "[5] Commit"
git commit -m "Automated maintenance $(date +%F_%T)" || true

echo
echo "[6] Push"
git push

echo
echo "Maintenance Complete."
