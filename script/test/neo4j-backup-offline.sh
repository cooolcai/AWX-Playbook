#!/usr/bin/env bash

DATETIME=$(date +%Y%m%d-%H%M)
BACKUP_DIR=/data/neo4j_backup/offline/
mkdir -p /data/neo4j_backup/offline/
source /etc/profile
neo4j stop
neo4j-admin dump --to=${BACKUP_DIR}${DATETIME}-neo4j.dump
neo4j start
neo4j status

