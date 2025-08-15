#!/bin/bash

# === Variables ===
DATE=$(date '+%F_%H-%M-%S')
BACKUP_DIR="/backups/linux/database/"
LOGFILE="$BACKUP_DIR/backup.log"

mkdir -p "$BACKUP_DIR"

log() {
    echo "[$(date '+%F %T')] $1" >> "$LOGFILE"
}

log "Starting MySQL backup..."

# Dump all databases (structure + data)
mysqldump --all-databases > "$BACKUP_DIR/mysql_backup_$DATE.sql"

# Compress the backup
gzip "$BACKUP_DIR/mysql_backup_$DATE.sql"

log "Backup complete: mysql_backup_$DATE.sql.gz"
