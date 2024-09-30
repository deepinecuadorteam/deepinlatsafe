#!/bin/bash

#    Developed by the Deepin.lat Team at Yachay Tech University
#    Free Software Tools | Automating Backups with Style
# ────────────────────────────────────────────────────────────────

# Set color variables for better aesthetics
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Backup settings for Deepin users
BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures" "/home/$USER/Downloads")
BACKUP_DEST="/home/$USER/backups"
BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
RCLONE_REMOTE="myclone"  # Replace with your rclone remote name
REMOTE_PATH="DeepinBackups"

# Function to create the backup
create_backup() {
    echo -e "${CYAN}💼 Preparing backup...${NC}"
    
    # Create backup directory if it doesn't exist
    mkdir -p "$BACKUP_DEST"

    # Create a tar.gz backup of the specified directories
    echo -e "${BLUE}📦 Creating backup archive...${NC}"
    tar -czf "$BACKUP_DEST/$BACKUP_NAME" "${BACKUP_SOURCE[@]}"
    
    # Encryption option
    if [[ $ENCRYPT_OPTION == "yes" ]]; then
        read -sp "🔒 Enter a password to encrypt the backup: " PASSWORD
        echo
        gpg --symmetric --passphrase "$PASSWORD" --cipher-algo AES256 "$BACKUP_DEST/$BACKUP_NAME"

        # Remove the unencrypted backup
        rm "$BACKUP_DEST/$BACKUP_NAME"
        BACKUP_NAME="$BACKUP_NAME.gpg"  # Update BACKUP_NAME to reflect the encrypted file
        echo -e "${GREEN}🔐 Backup encrypted successfully!${NC}"
        echo -e "🔒 Encrypted backup saved as: ${YELLOW}$BACKUP_DEST/$BACKUP_NAME${NC}"
    else
        echo -e "${GREEN}✅ Backup created successfully!${NC}"
        echo -e "📁 Backup saved as: ${YELLOW}$BACKUP_DEST/$BACKUP_NAME${NC}"
    fi
}

# Function to upload backup to the cloud using rclone
upload_to_cloud() {
    echo -e "${YELLOW}☁️ Uploading backup to the cloud...${NC}"
    rclone copy "$BACKUP_DEST/$BACKUP_NAME" "$RCLONE_REMOTE:$REMOTE_PATH"
    echo -e "${GREEN}☁️ Backup uploaded to the cloud successfully!${NC}"
}

# Start of Script: Ask the user for backup preferences
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
echo -e "🎯 ${CYAN}Where would you like to store your backup?${NC}"
echo -e "1) 💾 Local storage"
echo -e "2) ☁️  Online cloud (using rclone)"
echo -e "${CYAN}═══════════════════════════════════════════${NC}"
read -p "Please enter 1 or 2: " BACKUP_OPTION

#  Ask if the user wants to encrypt the backup
read -p "🔒 Do you want to encrypt the backup? (yes/no): " ENCRYPT_OPTION

# Execute based on user's choice
if [[ $BACKUP_OPTION == "1" ]]; then
    echo -e "${YELLOW}📁 Starting local backup...${NC}"
    create_backup
elif [[ $BACKUP_OPTION == "2" ]]; then
    echo -e "${BLUE}⚠️  Reminder: Ensure your rclone remote is configured (run 'rclone config').${NC}"
    read -p "Press Enter to continue if rclone is configured..."
    echo -e "${YELLOW}📁 Creating local backup before cloud upload...${NC}"
    create_backup
    upload_to_cloud
else
    echo -e "${RED}❌ Invalid option. Please run the script again.${NC}"
    exit 1
fi
