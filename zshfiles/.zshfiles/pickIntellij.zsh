pickIntellij() {
  local PROJECTS_ROOT="$HOME/git"
  local selected_dir

  command -v fzf >/dev/null || { echo "Error: fzf is not installed."; return 1; }
  command -v idea1 >/dev/null || { echo "Error: idea1 is not available in PATH."; return 1; }

  selected_dir=$(
    find "$PROJECTS_ROOT" -mindepth 1 -maxdepth 1 -type d -print \
    | sed "s|^$PROJECTS_ROOT/||" \
    | sort \
    | fzf --prompt="Open IntelliJ project> " --height=40% --reverse
  )

  [[ -z "${selected_dir:-}" ]] && return 0

  cd "$PROJECTS_ROOT/$selected_dir" || return 1
  idea1 .
}
