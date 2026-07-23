#!/usr/bin/env bash
set -e

cat > .gitignore << 'GIT'
*.log
*.aux
*.out
*.toc
*.tmp
.DS_Store
Thumbs.db
__pycache__/
*.pyc
build/
dist/
.cache/
GIT

mkdir -p .github/workflows

cat > .github/workflows/docs.yml << 'YAML'
name: Documentation Check

on:
  push:
  pull_request:

jobs:
  markdown:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: List Markdown files
        run: find . -name "*.md" | sort
YAML

cat > release.sh << 'REL'
#!/usr/bin/env bash
git add .
git commit -m "Repository update" || true
git push
REL

chmod +x release.sh

echo "GitHub setup complete."
