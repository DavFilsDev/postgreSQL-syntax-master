# restore_db.sh
#!/bin/bash
# Restore PostgreSQL database from backup
# Usage: ./restore_db.sh dbname backup_file.sql

DBNAME=$1
BACKUP_FILE=$2

psql $DBNAME < $BACKUP_FILE
echo "Database restored from $BACKUP_FILE"
