#!/usr/bin/env bash
# USAGE: $0 ID FILENAME ERROR_LOG_FILENAME

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "$DIR/coqbot-config.sh"

id="$1"
comment_contents="Error: Could not minimize file $2"
comment_contents+="${nl}<details><summary>error log</summary>${nl}${nl}${start_code}$(cat "$3")${end_code}</details>"

if [ ! -z "${COQBOT_URL}" ]; then
    curl -X POST --data-binary "${id}${nl}${comment_contents}" "${COQBOT_URL}"
else
    echo curl -X POST --data-binary "${id}${nl}${comment_contents}"
fi
