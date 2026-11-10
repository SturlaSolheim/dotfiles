bup() {
  rsync -av --delete "$HOME/Documents/bruno" "$HOME/OneDrive - Skatteetaten/bruno" &&
  rsync -av --delete "$HOME/notater/skatteetaten" "$HOME/OneDrive - Skatteetaten/notater"
}
