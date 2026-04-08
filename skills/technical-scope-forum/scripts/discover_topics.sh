#!/usr/bin/env bash

set -euo pipefail

SEARCH_URL="https://forum.skyeco.com/search.json?q=%22technical%20scope%22%20in%3Atitle"
TAG_URL="https://forum.skyeco.com/tag/technical-scope/1444.json"
TECHNICAL_SCOPE_PHRASE="technical scope"

fetch() {
  local url="$1"
  local tmp
  local attempt

  tmp=$(mktemp)
  for attempt in 1 2 3 4 5; do
    if curl -L -s "$url" -o "$tmp" && [[ -s "$tmp" ]]; then
      cat "$tmp"
      rm -f "$tmp"
      return 0
    fi
    sleep 1
  done
  rm -f "$tmp"
  return 6
}

match_outlier() {
  local headings="$1"
  local lower
  lower=$(printf '%s\n' "$headings" | tr '[:upper:]' '[:lower:]')
  [[ "$lower" == *"relevant audits"* ]] && return 0
  [[ "$lower" == *"audits"* ]] && return 0
  [[ "$lower" == *"pre-deployed contracts"* ]] && return 0
  [[ "$lower" == *"spell dependencies"* ]] && return 0
  [[ "$lower" == *"recommended spell instructions"* ]] && return 0
  [[ "$lower" == *"proposed spell content"* ]] && return 0
  [[ "$lower" == *"launch plan"* ]] && return 0
  [[ "$lower" == *"technical scope of the launch"* ]] && return 0
  return 1
}

search_json=$(fetch "$SEARCH_URL")
tag_json=$(fetch "$TAG_URL")

mapfile -t title_rows < <(
  printf '%s' "$search_json" \
    | jq -r '
        .topics[]
        | select(.title | ascii_downcase | contains("technical scope"))
        | [.id, .slug, .title, (.tags | map(.slug) | join(","))]
        | @tsv
      '
)

mapfile -t tag_rows < <(
  printf '%s' "$tag_json" \
    | jq -r '
        .topic_list.topics[]
        | [.id, .slug, .title, (.tags | map(.slug) | join(","))]
        | @tsv
      '
)

declare -A selected_ids=()
declare -a output_rows=()

for row in "${title_rows[@]}"; do
  IFS=$'\t' read -r id slug title tags <<<"$row"
  selected_ids["$id"]=1
  issues="-"
  if [[ ",$tags," != *,technical-scope,* ]]; then
    issues="missing-technical-scope-tag"
  fi
  output_rows+=("$id"$'\t'"title-search"$'\t'"$issues"$'\t'"$title")
done

tag_only_outlier_count=0

for row in "${tag_rows[@]}"; do
  IFS=$'\t' read -r id slug title tags <<<"$row"
  if [[ -n "${selected_ids[$id]:-}" ]]; then
    continue
  fi

  topic_json=$(fetch "https://forum.skyeco.com/t/$slug/$id.json")
  headings=$(
    printf '%s' "$topic_json" \
      | jq -r '.post_stream.posts[0].cooked | scan("<h[1-6][^>]*>(.*?)</h[1-6]>")[]' \
      | sed -E 's/<[^>]+>//g; s/&amp;/\&/g'
  )

  if ! match_outlier "$headings"; then
    continue
  fi

  selected_ids["$id"]=1
  output_rows+=("$id"$'\t'"tag-outlier"$'\t'"-"$'\t'"$title")
  tag_only_outlier_count=$((tag_only_outlier_count + 1))
done

printf 'Title-search topics: %s\n' "${#title_rows[@]}"
printf 'Tag-feed topics: %s\n' "${#tag_rows[@]}"
printf 'Selected topics: %s\n' "${#output_rows[@]}"
printf 'Tag-only outliers retained: %s\n' "$tag_only_outlier_count"
printf '%s\n' "${output_rows[@]}" | sort -r -n -k1,1
