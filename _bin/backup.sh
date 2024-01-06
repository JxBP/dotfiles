#!/bin/bash
# Creates a backup of my home folder excluding some unnecessary files to save
# disk space. The end result is a zstd compressed tar file.
#
# This script does NOT use absolute paths (more flexible) so watch out if a PATH
# injection is possible for your usecase.
#
# See below for a few variables to tweak this script.
#
# Author: JxBP
# Date: 2023-05-20

# ----------- CONFIG -----------
# The list of excludes for tar
EXCLUDE_LIST="${DOTFILES:-$HOME/dotfiles}/_bin/exclude.lst"

# The backup file name WITHOUT suffixes.
# We use a UNIX timestamp (+%s) so it's more unique and a ISO 8601 date (-I) as
# it is easier to spot from when this backup is.
BACKUP_NAME="$(date +%s)_backup_$(date -I)"
# ------------------------------

tar                                 \
    --exclude-vcs-ignores           \
    --exclude-from "$EXCLUDE_LIST"  \
    --totals                        \
    --verbose                       \
    --create                        \
    --file "${BACKUP_NAME}.tar"     \
    "$HOME"

# tar may exit with an error if it doesn't have to permission to read some file
# so this could get annoying if set before tar. We don't want to delete the tar
# file if compression fails though.
set -e

zstd "${BACKUP_NAME}.tar"

# Remove the old tar file
rm "${BACKUP_NAME}.tar"

echo "${BACKUP_NAME}.tar.zstd"
