# Common remerge client functions and environment.

# source common functions and environment
. /usr/lib/remerge/common.sh

# source client configuration
. /etc/remerge/client.conf 2>/dev/null || die "missing /etc/remerge/client.conf"

# wrapper to ssh
REMERGE_SSH="ssh -t -q -o ConnectTimeout=3 $REMERGE_SERVER"

# screen session name
REMERGE_SCREEN="remerge.$REMERGE_CLIENT"

# get server configuration
source_server_config () {
  eval "$($REMERGE_SSH /bin/bash -c true "
    . /usr/lib/remerge/server.sh $REMERGE_CLIENT
    declare -p
  " | grep -o 'REMERGE_.*"')"
}
