#!/usr/bin/env bash

DATETIME=$(date +%Y%m%d-%H%M)
BACKUP_DIR=/data/neo4j_backup/online-tar/
APP_DIR=/02-neo4j/neo4j
mkdir -p /data/neo4j_backup/offline/
source /etc/profile
tar -cvzf ${BACKUP_DIR}${DATETIME}-neo4j.tar.gz ${APP_DIR}
