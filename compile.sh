#!/bin/bash

CHECK_CORE_FILE() {
    CORE_FILE="$(dirname $0)/core"
    if [[ -f "${CORE_FILE}" ]]; then
        . "${CORE_FILE}"
    else
		echo "!!! core file does not exist !!!"
        exit 1
    fi
}

CHECK_CORE_FILE
if [ $# == 0 ]; then
    COMFILE_FIRMWARE
    exit 0
fi
if [$1 == 'all']; then
    for i in `ls ${SCRIPT_DIR}/conf`; do
        echo && echo -e "${INFO} Compile $i !"
        COMFILE_FIRMWARE "$i"
        MOVE_FIRMWARE "$i"
    done
fi
for i in "$@"; do
    echo && echo -e "${INFO} Compile $i !"
    COMFILE_FIRMWARE "$i"
    MOVE_FIRMWARE "$i"
done
exit 0