#!/bin/bash
SCRIPT_DIR=$(cd "$(dirname "$0")";pwd)

CHECK_CORE_FILE() {
    CORE_FILE="$(dirname $0)/core"
    if [[ -f "${CORE_FILE}" ]]; then
        . "${CORE_FILE}"
    else
        echo "!!! core file does not exist !!!"
        exit 1
    fi
}

git -C ${SCRIPT_DIR} pull

CHECK_CORE_FILE
UPDATE_LEDE
UPDATE_FEEDS
exit 0