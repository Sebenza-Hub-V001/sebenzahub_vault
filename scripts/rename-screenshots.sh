#!/usr/bin/env bash
# rename-screenshots.sh
# ---------------------------------------------------------------------------
# Phase 1: Finds any "Pasted image *.png" files scattered anywhere in the
#           vault and moves them to 13-raw/screenshots/, updating references.
# Phase 2: Renames those files based on the chapter + heading where they
#           appear in "01 How-To Documents/".
#
# Usage:  bash scripts/rename-screenshots.sh          (dry-run by default)
#         bash scripts/rename-screenshots.sh --apply   (actually move + rename)
# ---------------------------------------------------------------------------

set -euo pipefail

VAULT="$(cd "$(dirname "$0")/.." && pwd)"
SCREENSHOTS="$VAULT/13-raw/screenshots"
HOWTO="$VAULT/01 How-To Documents"
DRY_RUN=true

[[ "${1:-}" == "--apply" ]] && DRY_RUN=false

# ── helpers ──────────────────────────────────────────────────────────────────

to_kebab() {
  echo "$1" \
    | sed 's/[—–]/-/g' \
    | sed 's/[^a-zA-Z0-9 -]//g' \
    | tr '[:upper:]' '[:lower:]' \
    | tr ' ' '-' \
    | sed 's/--*/-/g; s/^-//; s/-$//'
}

find_nearest_heading() {
  local file="$1" line="$2"
  head -n "$line" "$file" \
    | tac \
    | grep -m1 '^##' \
    | sed 's/^#* *//'
}

extract_chapter_num() {
  basename "$1" | grep -oP '^\d+' || echo "00"
}

# ── phase 1: collect stray screenshots ───────────────────────────────────────

echo "=== Phase 1: Move stray screenshots to 13-raw/screenshots/ ==="
echo ""

moved=0
while IFS= read -r -d '' img; do
  # Skip files already in the target directory
  img_dir="$(dirname "$img")"
  if [[ "$img_dir" == "$SCREENSHOTS" ]]; then
    continue
  fi

  basename_img="$(basename "$img")"
  # Relative path from vault root (for updating references)
  rel_old="${img#"$VAULT/"}"
  rel_new="13-raw/screenshots/$basename_img"

  echo "── $rel_old"
  echo "   → $rel_new"

  if $DRY_RUN; then
    echo "   (dry run — no changes made)"
  else
    # Handle name collision in target directory
    target="$SCREENSHOTS/$basename_img"
    if [[ -f "$target" ]]; then
      echo "   ⚠  File already exists in target — skipping move"
      echo ""
      continue
    fi

    mv "$img" "$target"

    # Update all markdown references to use the new path
    # Match common Obsidian embed patterns:
    #   ![[path/to/Pasted image ...]]
    #   ![[Pasted image ...]]
    #   [[path/to/Pasted image ...]]
    grep -rlF "$basename_img" "$VAULT" --include='*.md' 2>/dev/null | while read -r mdfile; do
      # Replace any path prefix before the filename with the canonical path
      # Handles: ![[Pasted image ...]], ![[subfolder/Pasted image ...]],
      #          ![[13-raw/screenshots/Pasted image ...]] (already correct, no-op)
      sed -i "s|\[\[\\([^]]*\\)$basename_img\]\]|[[${rel_new}]]|g" "$mdfile"
    done
    echo "   ✓ moved + references updated"
  fi

  moved=$((moved + 1))
  echo ""
done < <(find "$VAULT" -name "Pasted image *.png" -print0 2>/dev/null)

if [[ $moved -eq 0 ]]; then
  echo "No stray screenshots found outside 13-raw/screenshots/."
fi
echo ""

# ── phase 2: rename screenshots by context ───────────────────────────────────

echo "=== Phase 2: Rename screenshots by chapter + heading ==="
echo ""

shopt -s nullglob
pasted=("$SCREENSHOTS"/Pasted\ image\ *.png)
shopt -u nullglob

if [[ ${#pasted[@]} -eq 0 ]]; then
  echo "No 'Pasted image *.png' files to rename — all clean."
  exit 0
fi

echo "Found ${#pasted[@]} screenshot(s) to rename."
echo ""

declare -A renames  # new_basename -> old_basename (collision tracking)

for img in "${pasted[@]}"; do
  old_basename="$(basename "$img")"
  echo "── $old_basename"

  # Find which markdown file(s) reference this image
  ref_file=""
  ref_line=""

  while IFS=: read -r file line _rest; do
    ref_file="$file"
    ref_line="$line"
    break
  done < <(grep -rnF "$old_basename" "$HOWTO" 2>/dev/null || true)

  if [[ -z "$ref_file" ]]; then
    while IFS=: read -r file line _rest; do
      ref_file="$file"
      ref_line="$line"
      break
    done < <(grep -rnF "$old_basename" "$VAULT" --include='*.md' 2>/dev/null || true)
  fi

  if [[ -z "$ref_file" ]]; then
    echo "   ⚠  Not referenced in any .md file — skipping"
    echo ""
    continue
  fi

  echo "   Referenced in: $ref_file (line $ref_line)"

  # Derive chapter number
  ch_num="$(extract_chapter_num "$ref_file")"
  ch_prefix="ch$(printf '%02d' "$ch_num")"

  # Derive section name from nearest heading
  heading="$(find_nearest_heading "$ref_file" "$ref_line")"
  if [[ -z "$heading" ]]; then
    heading="screenshot"
  fi
  echo "   Nearest heading: $heading"

  slug="$(to_kebab "$heading")"
  new_basename="${ch_prefix}-${slug}.png"

  # Handle collisions: append -2, -3, etc.
  counter=1
  candidate="$new_basename"
  while [[ -f "$SCREENSHOTS/$candidate" ]] || [[ -n "${renames[$candidate]:-}" ]]; do
    counter=$((counter + 1))
    candidate="${ch_prefix}-${slug}-${counter}.png"
  done
  new_basename="$candidate"
  renames["$new_basename"]="$old_basename"

  echo "   → $new_basename"

  if $DRY_RUN; then
    echo "   (dry run — no changes made)"
  else
    mv "$img" "$SCREENSHOTS/$new_basename"

    grep -rlF "$old_basename" "$VAULT" --include='*.md' 2>/dev/null | while read -r mdfile; do
      sed -i "s|$old_basename|$new_basename|g" "$mdfile"
    done
    echo "   ✓ renamed + references updated"
  fi

  echo ""
done

if $DRY_RUN; then
  echo "This was a dry run. Re-run with --apply to rename files."
else
  echo "Done. All screenshots moved and renamed."
fi
