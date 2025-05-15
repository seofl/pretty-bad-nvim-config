#!/bin/bash

# Paths
SOURCE_DIR="$HOME/Documents/nvim_config"
DEST_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.old"

# Step 1: Backup current config
if [ -d "$DEST_DIR" ]; then
  echo "Backing up existing config to $BACKUP_DIR"
  mv "$DEST_DIR" "$BACKUP_DIR"
fi

# Step 2: Copy new config (excluding .git)
echo "Copying new config from $SOURCE_DIR (excluding .git)"
if rsync -a --exclude='.git' --exclude='copy.sh' "$SOURCE_DIR/" "$DEST_DIR/"; then
  echo "Config copied successfully, removing backup"
  rm -rf "$BACKUP_DIR"
else
  echo "Something went wrong. Restoring old config..."
  rm -rf "$DEST_DIR"
  mv "$BACKUP_DIR" "$DEST_DIR"
  echo "Old config restored"
fi

