export CLICOLOR=1
alias c='clear'
alias l='ls -al'
alias ls='ls -Gt'

function lsg() {
  setopt local_options no_monitor
  local dir="${1:-.}"
  local tmpdir=$(mktemp -d)
  local names=()

  for d in "$dir"/*/; do
    [ -d "$d" ] || continue
    local name=$(basename "$d")
    names+=("$name")
    (
      if [ -d "$d/.git" ]; then
        branch=$(git -C "$d" branch --show-current 2>/dev/null)
        [ -z "$branch" ] && branch=$(git -C "$d" rev-parse --short HEAD 2>/dev/null)
        echo "$branch" > "$tmpdir/$name"
      fi
    ) &
  done
  wait

  local entries=()
  for name in "${names[@]}"; do
    if [ -f "$tmpdir/$name" ]; then
      entries+=("$name ($(cat "$tmpdir/$name"))")
    else
      entries+=("$name")
    fi
  done
  rm -rf "$tmpdir"

  printf '%s\n' "${entries[@]}" | column -c ${COLUMNS:-80} | sed $'s/(\\([^)]*\\))/\e[33m(\\1)\e[0m/g'
}