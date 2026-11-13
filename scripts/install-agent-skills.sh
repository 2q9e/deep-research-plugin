#!/usr/bin/env bash
set -euo pipefail

plugin_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target_root="${1:-$PWD}"

if [[ ! -d "$target_root" ]]; then
  printf 'Target project directory does not exist: %s\n' "$target_root" >&2
  exit 2
fi

target_root="$(cd "$target_root" && pwd)"
target_skills="$target_root/.agents/skills"
mkdir -p "$target_skills"

for source_skill in "$plugin_root"/skills/*; do
  [[ -f "$source_skill/SKILL.md" ]] || continue
  skill_name="$(basename "$source_skill")"
  destination="$target_skills/$skill_name"
  mkdir -p "$destination"
  cp -R "$source_skill/." "$destination/"
done

printf 'Installed Deep Research Engine skills in %s\n' "$target_skills"
