#!/bin/bash

# === Variables ===
CLIENT_USER="sentinel"
CLIENT_IP="192.168.1.108"
SSH_PORT=22

TIMESTAMP=$(date '+%F_%H-%M')
BACKUP_BASE="/backups/linux/webserver/$TIMESTAMP"
LOGFILE="/backups/linux/webserver/backup.log"

# === Create directory structure ===
mkdir -p "$BACKUP_BASE/html" "$BACKUP_BASE/apache2"
mkdir -p "$(dirname "$LOGFILE")"

# === Logging function ===
log() {
    echo "[$(date '+%F %T')] $1" >> "$LOGFILE"
}

log "==== Starting backup at $TIMESTAMP ===="

# === Rsync commands ===
log "Syncing /var/www/html/ from $CLIENT_IP"
rsync -avz -e "ssh -p $SSH_PORT" "${CLIENT_USER}@${CLIENT_IP}:/var/www/html/" "$BACKUP_BASE/html/" >> "$LOGFILE" 2>&1

log "Syncing /etc/apache2/ from $CLIENT_IP"
rsync -avz -e "ssh -p $SSH_PORT" "${CLIENT_USER}@${CLIENT_IP}:/etc/apache2/" "$BACKUP_BASE/apache2/" >> "$LOGFILE" 2>&1

# === Optional compression ===
ARCHIVE_NAME="web_backup-${TIMESTAMP}.tar.gz"
tar -czf "$BACKUP_BASE/../$ARCHIVE_NAME" -C "$BACKUP_BASE" . >> "$LOGFILE" 2>&1

log "Backup complete. Archive created: $ARCHIVE_NAME"
log "==== End of backup ====\n"
