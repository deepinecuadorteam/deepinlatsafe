#!/bin/bash

# -----------------------------------------------------------
# ▗▄▄▄ ▗▄▄▄▖▗▄▄▄▖▗▄▄▖▗▄▄▄▖▗▖  ▗▖     ▗▄▄▖ ▗▄▖ ▗▄▄▄▖▗▄▄▄▖
# ▐▌  █▐▌   ▐▌   ▐▌ ▐▌ █  ▐▛▚▖▐▌    ▐▌   ▐▌ ▐▌▐▌   ▐▌ 
# ▐▌  █▐▛▀▀▘▐▛▀▀▘▐▛▀▘  █  ▐▌ ▝▜▌     ▝▀▚▖▐▛▀▜▌▐▛▀▀▘▐▛▀▀▘
# ▐▙▄▄▀▐▙▄▄▖▐▙▄▄▖▐▌  ▗▄█▄▖▐▌  ▐▌    ▗▄▄▞▘▐▌ ▐▌▐▌   ▐▙▄▄▖
# Developed by the Deepin.lat Team at Yachay Tech University
# We use free software tools to automate backups
# -----------------------------------------------------------

# Set text color variables for better aesthetics
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Backup settings for Deepin users
BACKUP_SOURCE=(
    "/home/$USER/Documents"
    "/home/$USER/Pictures"
    "/home/$USER/Downloads"
)
BACKUP_DEST="/home/$USER/backups"  # Recommended backup location, replace $USER for your current user
BACKUP_NAME="deepin-backup-$(date +'%Y-%m-%d').tar.gz"
RCLONE_REMOTE="myclone"  # Replace this with the name of the rclone remote
REMOTE_PATH="DeepinBackups"  # Folder name in cloud storage

# Display the introductory message
echo -e "${BLUE}-----------------------------------------------------------"
echo -e "▗▄▄▄ ▗▄▄▄▖▗▄▄▄▖▗▄▄▖▗▄▄▄▖▗▖  ▗▖     ▗▄▄▖ ▗▄▖ ▗▄▄▄▖▗▄▄▄▖"
echo -e "▐▌  █▐▌   ▐▌   ▐▌ ▐▌ █  ▐▛▚▖▐▌    ▐▌   ▐▌ ▐▌▐▌   ▐▌   "
echo -e "▐▌  █▐▛▀▀▘▐▛▀▀▘▐▛▀▘  █  ▐▌ ▝▜▌     ▝▀▚▖▐▛▀▜▌▐▛▀▀▘▐▛▀▀▘"
echo -e "▐▙▄▄▀▐▙▄▄▖▐▙▄▄▖▐▌  ▗▄█▄▖▐▌  ▐▌    ▗▄▄▞▘▐▌ ▐▌▐▌   ▐▙▄▄▖"
echo -e "Developed by the Deepin.lat Team at Yachay Tech University"
echo -e "We use free software tools to automate backups"
echo -e "Desarrollado por el equipo Deepin.lat"

# Step 1: Sync files using rsync
echo -e "${YELLOW}Starting rsync for Deepin folders...${NC}"
for dir in "${BACKUP_SOURCE[@]}"; do
    echo -e "${GREEN}Syncing: ${dir}${NC}"
    rsync -av --delete "$dir" "$BACKUP_DEST"
done

# Step 2: Compress the backup directory using tar
echo -e "${YELLOW}Compressing backup...${NC}"
tar -czvf "/tmp/$BACKUP_NAME" -C "$BACKUP_DEST" .

# Step 3: Upload the compressed file to the cloud using rclone
echo -e "${YELLOW}Uploading backup to cloud...${NC}"
rclone copy "/tmp/$BACKUP_NAME" "$RCLONE_REMOTE:$REMOTE_PATH"

# Step 4: Clean up temporary files
echo -e "${YELLOW}Cleaning up...${NC}"
rm -rf "$BACKUP_DEST/*"
rm "/tmp/$BACKUP_NAME"

echo -e "${GREEN}Backup completed successfully for Deepin! ¡Copia de seguridad completada exitosamente para Deepin! ${NC}"
