#!/usr/bin/env bash
set -euo pipefail

groupdel ${GNAME}
groupadd -o -g ${GID} ${GNAME}
useradd -o -l -u ${UID} -g ${GNAME} -m ${UNAME}
chown ${UNAME}:${GNAME} /home/${UNAME}

exec gosu ${UNAME} "$@"
