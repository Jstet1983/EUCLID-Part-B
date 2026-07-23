#!/usr/bin/env bash
set -e

echo "=== EUCLID Project Manager ==="

case "$1" in
init)
    ./generate_toc.sh || true
    ./populate_readme.sh || true
    ./setup_github.sh || true
    ./setup_pages.sh || true
    ;;

commit)
    git add .
    git commit -m "${2:-Repository update}" || true
    ;;

push)
    git push
    ;;

release)
    git add .
    git commit -m "Release $(date +%Y.%m.%d)" || true
    git tag -a "v$(date +%Y.%m.%d)" -m "EUCLID Release"
    git push
    git push --tags
    ;;

status)
    git status
    git branch
    git remote -v
    ;;

tree)
    find . -type f | sort
    ;;

*)
echo "Usage:"
echo "  ./euclid.sh init"
echo "  ./euclid.sh commit \"message\""
echo "  ./euclid.sh push"
echo "  ./euclid.sh release"
echo "  ./euclid.sh status"
echo "  ./euclid.sh tree"
;;
esac
