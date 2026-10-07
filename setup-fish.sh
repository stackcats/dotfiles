#!/usr/bin/env bash

BASHRC="$HOME/.bashrc"

if grep -Fq 'export PATH="$HOME/.nix-profile/bin:$PATH"' "$BASHRC"; then
    echo "Fish config is already existed in bashrc"
else
    cat >> "$BASHRC" <<'EOF'

export PATH="$HOME/.nix-profile/bin:$PATH"
if [[ $- == *i* ]] && [ -x "$HOME/.nix-profile/bin/fish" ]; then
    exec "$HOME/.nix-profile/bin/fish"
fi
EOF
    echo "Fish config is added to bashrc"
fi
