#!/bin/bash

# Set variables
S3_BUCKET="qoala-gaurav-bucket"
BACKUP_DIR="S3_backup"
DATE=$(date +"%Y-%m-%d")
BACKUP_FILE="$BACKUP_DIR/${S3_BUCKET}_backup_$DATE.tar.gz"

echo "$BACKUP_FILE"

# Ensure the backup directory exists
mkdir -p $BACKUP_DIR

# Sync S3 bucket to local directory
aws s3 sync s3://$S3_BUCKET $BACKUP_DIR

# Create tar archive
tar -zcvf $BACKUP_FILE $BACKUP_DIR

# Clean up local backup directory
rm -rf $BACKUP_DIR/*