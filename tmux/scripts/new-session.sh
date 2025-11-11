#!/usr/bin/env zsh

read "name?Session name: "

echo "You entered: $name"

if [[ -z "$name" ]]; then
    echo "No name provided"
    sleep 2
    exit 1
fi

echo "Creating session: $name"

if ! tmux has-session -t "$name" 2>/dev/null; then
    echo "Session doesn't exist, creating..."
    tmux new-session -d -s "$name"
    echo "Session created"
else
    echo "Session already exists"
fi

sleep 1
echo "Switching to session..."
tmux switch-client -t "$name
