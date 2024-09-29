Deepin Backup Tool Tutorial

Welcome to the Deepin Backup Tool tutorial! This guide will walk you through installing and using the tool to back up your important files effortlessly.
Table of Contents

    Overview
    Prerequisites
    Installation
    Configuring rclone
    Configuration
    Running the Backup
    Verifying Backups
    Customization
    Troubleshooting
    Contributing

Overview

The Deepin Backup Tool automates the backup process for Deepin users by:

    Syncing essential directories (Documents, Pictures, Downloads) with rsync. (more folders can be addes as user want, check customization)
    Compressing the backups into .tar.gz files.
    Uploading the backups to cloud storage using rclone.

Prerequisites

Before you begin, ensure that you have the following installed:

    Deepin OS: This tool is specifically designed for Deepin users.
    rsync: Usually pre-installed on Deepin. Check by running rsync --version in the terminal.
    tar: Also pre-installed. Check with tar --version.
    rclone: If not installed, you can install it using:

bash

sudo apt update
sudo apt install rsync tar rclone cron -y

Installation

    Clone the Repository: Open a terminal and run the following command to clone the repository:

    bash

git clone https://github.com/deepinecuadorteam/lateam-backup-tool.git

Navigate to the Directory: Change to the directory where the script is located:

bash

cd lateam-backup-tool

Make the Script Executable: Run the following command to make the script executable:

bash

    chmod +x deepinlatbackup.sh

Configuring rclone

Before using the backup tool, you need to configure rclone to connect to your cloud storage:

    Run rclone Configuration: In the terminal, run:

    bash

    rclone config

    Create a New Remote:
        Choose n to create a new remote.
        Enter a name for your remote (e.g., myclone).

    Select Cloud Storage Type: Choose the type of cloud storage you want to use (e.g., Google Drive, Dropbox, etc.) by selecting the corresponding number from the list.

    Configure OAuth Credentials: Follow the prompts to enter your client_id and client_secret if required. If you're unsure, you can usually leave these blank.

    Authorize rclone: When prompted, you may need to follow a URL to authorize rclone to access your cloud storage. Copy the authorization code back into the terminal.

    Finish Configuration: Follow the remaining prompts to finish the configuration. You should see a confirmation message once complete.

Configuration

Before running the tool, you may want to configure the backup settings in the script:

    Edit the Script: Open the script in a text editor:

    bash

    nano deepinlatbackup.sh

    Adjust Backup Source Directories: Ensure the directories listed in the BACKUP_SOURCE variable include all the directories you wish to back up.

    Set the Backup Destination: Modify BACKUP_DEST to your preferred backup location. The default is set to /home/Owens/backups.

    Configure rclone: Ensure you have set up rclone and configured the remote storage you want to use. Replace myclone in RCLONE_REMOTE with your rclone remote name.

Running the Backup

    Execute the Script: In the terminal, run the script to start the backup process:

    bash

    ./deepinlatbackup.sh

    Monitor Progress: You will see messages indicating the progress of the backup, including syncing, compressing, and uploading to the cloud.

    Completion Message: Once the backup is complete, you will see a confirmation message.

Verifying Backups

To verify that your backups were successful, check the following:

    Local Backup: Navigate to your specified backup directory (/home/Owens/backups) and ensure the files are present.
    Cloud Backup: Check your cloud storage to confirm that the backup files have been uploaded.

Customization

You can further customize the tool by:

    Adding or removing directories in the BACKUP_SOURCE array.
    Changing the backup file name format in the BACKUP_NAME variable.

Troubleshooting

If you encounter issues:

    Permissions: Ensure you have the necessary permissions to read the source directories and write to the backup destination.
    rclone Issues: Double-check your rclone configuration. Make sure the remote name and folder paths are correct.

Contributing

Contributions are welcome! If you have suggestions, improvements, or bug fixes, please submit a pull request on GitHub.
