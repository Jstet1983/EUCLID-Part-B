#!/usr/bin/env bash

find . -name "*.md" | sort > TOC.md

echo "" >> TOC.md
echo "Generated $(date)" >> TOC.md
