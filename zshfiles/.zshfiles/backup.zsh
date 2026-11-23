bup() {
  local destination_root="$HOME/OneDrive - Skatteetaten"
  local src folder_name
  local -a sources=(
    "$HOME/Documents/bruno"
    "$HOME/notater/skatteetaten"
  )

  mkdir -p "$destination_root" || return $?

  for src in "${sources[@]}"; do
    if [[ ! -d "$src" ]]; then
      print -u2 "backup: source folder not found: $src"
      return 1
    fi

    folder_name="${src:t}"
    rsync -av --delete -- "$src/" "$destination_root/$folder_name/" || return $?
  done
}
