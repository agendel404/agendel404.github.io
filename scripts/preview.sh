#!/usr/bin/env bash
# Local preview at http://localhost:4000 (optional; GitHub publishes without this).
# Needs Ruby + Bundler once:  bundle install
#
# The pre-publish check runs first. [X] gaps only print a warning. It STOPS the preview
# for visible TODO boxes or placeholder files. To look at a draft anyway:
#   bash scripts/preview.sh --draft
cd "$(dirname "$0")/.."
export LANG="${LANG:-en_US.UTF-8}" LC_ALL="${LC_ALL:-en_US.UTF-8}"   # Jekyll needs a UTF-8 locale

draft=false
args=()
for a in "$@"; do
  if [ "$a" = "--draft" ]; then draft=true; else args+=("$a"); fi
done

if ! bash scripts/check.sh; then
  if [ "$draft" = true ]; then
    echo
    echo "⚠  DRAFT PREVIEW: this site is NOT ready to publish (see above)."
    echo
  else
    echo
    echo "Preview stopped. Fix the items above, or run: bash scripts/preview.sh --draft"
    exit 1
  fi
fi
exec bundle exec jekyll serve --livereload "${args[@]}"
