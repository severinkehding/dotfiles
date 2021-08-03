#!/bin/bash
# Backup script copying to an OFFSITE location
set -x
#dry_run=--dry-run
#progress=--progress
verbose=-v8

# read configuration
source ~/.duplicity.conf

# check everything exists
if [[ ${#SOURCE_DIRS[*]} != ${#BACKUP_DIRS[*]} ]]
then
    echo "SOURCE_DIRS and BACKUP_DIRS must match in size, exiting"
    exit 1
fi
for dir in ${SOURCE_DIRS[*]}
do
    if [[ ! -d $dir ]]
    then
        echo "$dir does not exist, exiting"
        exit 1
    fi
done

for i in ${!SOURCE_DIRS[*]}
do
    sourceDir=${SOURCE_DIRS[$i]}
    backupDir=${BACKUP_DIRS[$i]}
    if [[ ${#EXCLUDE_DIRS[$i]} > 0 ]]
    then
        excludes="--exclude $(sed -e 's/ / --exclude /g' <<<"${EXCLUDE_DIRS[$i]}")"
    else
        excludes=""
    fi

    duplicity $dry_run $progress $verbose --full-if-older-than 5M $excludes $sourceDir $OFFSITE/$backupDir
    duplicity verify $OFFSITE/$backupDir $sourceDir
done

unset PASSPHRASE
unset OFFSITE
