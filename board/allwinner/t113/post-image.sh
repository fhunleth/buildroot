#!/bin/sh

set -e

BOARD_DIR="$(dirname $0)"

fwup -c -f "${BOARD_DIR}/fwup.conf" -o "${BINARIES_DIR}/emmc.fw"

echo "Boot Trellis into USB FEL mode and run 'fwup images/emmc.fw'"
