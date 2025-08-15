#!/bin/bash

# === Variables ===
DATE=$(date '+%F_%H-%M-%S')
DEST_DIR="/backups/windows/monitoring/$DATE"
LOGFILE="/backups/windows/monitoring/backup.log"
SOURCE_DIR="/mnt/prtg_backup"

# === Logging function ===
log() {
    echo "[$(date '+%F %T')] $1" >> "$LOGFILE"
}

log "=== Starting PRTG backup ==="

# 1. Ensure destination directory exists
mkdir -p "$DEST_DIR"
log "Created backup destination: $DEST_DIR"

# 2. Copy files from mounted share
if [ -d "$SOURCE_DIR" ]; then
    cp -r "$SOURCE_DIR"/* "$DEST_DIR"
    log "Copied files from $SOURCE_DIR to $DEST_DIR"
else
    log "ERROR: Source directory $SOURCE_DIR does not exist or is not mounted."
    exit 1
fi

# 3. Keep only last 7 backups
find /backups/windows/monitoring/ -maxdepth 1 -type d -mtime +7 -exec rm -rf {} \;
log "Old backups older than 7 days removed"

log "=== PRTG backup completed successfully ==="

