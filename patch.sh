#!/data/data/com.termux/files/usr/bin/bash
#
# Project EUCLID
# Simple Patch / Version Manager
#

set -euo pipefail

ROOT="${1:-$PWD}"

cd "$ROOT"

DATE=$(date +"%Y-%m-%d %H:%M:%S")
VERSION_FILE=".euclid_version"
CHANGELOG="CHANGELOG.md"

###############################################################################
# Initialize
###############################################################################

if [ ! -f "$VERSION_FILE" ]; then
    echo "0.0.0" > "$VERSION_FILE"
fi

if [ ! -f "$CHANGELOG" ]; then
cat > "$CHANGELOG" <<DOC
# Changelog

DOC
fi

###############################################################################
# Read Version
###############################################################################

VERSION=$(cat "$VERSION_FILE")

IFS='.' read MAJOR MINOR PATCH <<< "$VERSION"

###############################################################################
# Bump Type
###############################################################################

TYPE="${2:-patch}"

case "$TYPE" in

major)
    ((MAJOR++))
    MINOR=0
    PATCH=0
;;

minor)
    ((MINOR++))
    PATCH=0
;;

patch)
    ((PATCH++))
;;

*)
    echo "Usage:"
    echo
    echo "patch.sh /path major"
    echo "patch.sh /path minor"
    echo "patch.sh /path patch"
    exit 1
;;

esac

NEW="$MAJOR.$MINOR.$PATCH"

echo "$NEW" > "$VERSION_FILE"

###############################################################################
# Changelog
###############################################################################

MESSAGE="${3:-Automatic Update}"

cat >> "$CHANGELOG" <<DOC

---

## Version $NEW

Date:
$DATE

Summary:

$MESSAGE

DOC

###############################################################################
# Git Commit
###############################################################################

git add .

git commit -m "EUCLID $NEW - $MESSAGE"

###############################################################################
# Optional Git Tag
###############################################################################

git tag "v$NEW"

###############################################################################
# Optional Push
###############################################################################

if git remote | grep -q origin; then

    git push

    git push origin "v$NEW"

fi

###############################################################################

echo

echo "======================================="
echo " Updated Project EUCLID"
echo " Version : $NEW"
echo "======================================="

