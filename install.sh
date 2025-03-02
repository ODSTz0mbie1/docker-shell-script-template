#!/bin/sh

# Ensure Docker is installed and available
if ! command -v docker >/dev/null 2>&1; then
    echo "Error: Docker is not installed or not found in PATH."
    exit 1
fi

# Build the Docker image
docker build -t script1 . || { echo "Error: Docker build failed"; exit 1; }

# Define the alias string
ALIAS="alias testscript='docker run --rm -v /:/app/data script1 -d $(pwd | sed 's/^\///')'"

# Detect the user's shell and appropriate config file
case "$SHELL" in
    */bash)
        CONFIG_FILE="$HOME/.bash_profile"
        # On macOS, .bash_profile is common; on Linux, .bashrc might be preferred
        [ -f "$HOME/.bashrc" ] && CONFIG_FILE="$HOME/.bashrc"
        ;;
    */zsh)
        CONFIG_FILE="$HOME/.zshrc"
        ;;
    */sh)
        CONFIG_FILE="$HOME/.profile"
        ;;
    *)
        CONFIG_FILE="$HOME/.profile"
        echo "Warning: Unknown shell ($SHELL), defaulting to $CONFIG_FILE"
        ;;
esac

# Check if the alias already exists in the current session
if alias testscript >/dev/null 2>&1; then
    echo "Alias 'testscript' already exists in the current session."
    exit 1  # Or exit 0 if this isn’t an error
fi

# Check if the alias is already in the config file to avoid duplicates
if [ -f "$CONFIG_FILE" ] && ! grep -q "alias testscript=" "$CONFIG_FILE"; then
    echo "$ALIAS" >> "$CONFIG_FILE"
    echo "Added alias to $CONFIG_FILE."
else
    echo "Alias 'testscript' already exists in $CONFIG_FILE or file not found."
fi

# Source the appropriate config file if possible
if [ -f "$CONFIG_FILE" ]; then
    . "$CONFIG_FILE" 2>/dev/null || echo "Warning: Could not source $CONFIG_FILE"
    echo "Alias 'testscript' is now available in this session."
else
    echo "Error: Config file $CONFIG_FILE not found. Alias added but not applied to this session."
    echo "Please run: . $CONFIG_FILE or restart your shell."
fi

exit 0