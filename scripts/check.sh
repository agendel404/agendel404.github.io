#!/usr/bin/env bash
# Pre-publish check. Runs before every GitHub deploy and before the local preview.
#
# BLOCKS publishing (exit 1) for:
#   · visible TODO boxes ({% include todo.html %}) in your content
#   · the placeholder LinkedIn URL (YOUR-HANDLE)
#   · a missing or placeholder resume PDF
#
# WARNS only (never blocks) about [X] gaps. They publish as written until you fill them in.
# TODO notes inside {% comment %} blocks are never published, so they don't block either.
set -u
cd "$(dirname "$0")/.."

CONTENT=(_case_studies _data _config.yml index.html 404.html)
problems=0

hits=$(grep -rnE 'include todo\.html|YOUR-HANDLE' "${CONTENT[@]}" 2>/dev/null)
if [ -n "$hits" ]; then
  echo "✗ Must fix before publishing (file:line):"
  echo "$hits" | sed 's/^/    /'
  problems=$((problems + $(echo "$hits" | wc -l)))
fi

resume=assets/resume/andrew-gendel-resume.pdf
if [ ! -f "$resume" ]; then
  echo "✗ Resume missing: $resume"; problems=$((problems + 1))
elif grep -q 'PLACEHOLDER-RESUME' "$resume"; then
  echo "✗ $resume is still the placeholder. Replace it with your general resume."
  problems=$((problems + 1))
fi

xcount=$(grep -roE '\[X[^]]*\]' "${CONTENT[@]}" 2>/dev/null | wc -l | tr -d ' ')
if [ "$xcount" -gt 0 ]; then
  echo "⚠ $xcount [X] gap(s) still in your content (publishing anyway): $(grep -rlE '\[X[^]]*\]' "${CONTENT[@]}" 2>/dev/null | tr '\n' ' ')"
fi

if [ "$problems" -gt 0 ]; then
  echo
  echo "Pre-publish check FAILED: $problems item(s) to fix. The site will not deploy until these are gone."
  exit 1
fi
echo "✓ Pre-publish check passed."
