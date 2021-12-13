# Common remerge server functions and environment.
#
# args: <client>

# source common functions and environment
. /usr/lib/remerge/common.sh

# source server configuration
. /etc/remerge/server.conf 2>/dev/null || die "missing /etc/remerge/server.conf"

# client name
REMERGE_CLIENT=$1
[ -z $REMERGE_CLIENT ] && die "missing client name"

# root directory
REMERGE_CLIENT_DIR="$REMERGE_DIR/$REMERGE_CLIENT"
mkdir -p $REMERGE_CLIENT_DIR

# mounted state file
REMERGE_MOUNTED_FILE="/run/remerge/$REMERGE_CLIENT.mounted"

# temporary directory
REMERGE_TMP_DIR="/tmp/remerge/$REMERGE_CLIENT"
mkdir -p $REMERGE_TMP_DIR

# variable state directory
REMERGE_VARLIB_DIR="$REMERGE_CLIENT_DIR/var/lib/remerge"
mkdir -p $REMERGE_VARLIB_DIR

# state file
REMERGE_STATE_FILE="$REMERGE_VARLIB_DIR/state"

# command file
REMERGE_CMD_FILE="$REMERGE_VARLIB_DIR/cmd"

# log file
REMERGE_LOG_FILE="$REMERGE_CLIENT_DIR/var/log/remerge.log"

# exclude file
REMERGE_EXCLUDE_FILE="$REMERGE_VARLIB_DIR/exclude"

# excluded packages
REMERGE_EXCLUDE="$(cat $REMERGE_EXCLUDE_FILE 2>/dev/null)"

# -march setting
REMERGE_MARCH_FILE="$REMERGE_VARLIB_DIR/march"

# DISTDIR location
REMERGE_DISTDIR="$REMERGE_CLIENT_DIR/var/cache/distfiles"
mkdir -p $REMERGE_DISTDIR

# PKGDIR location
REMERGE_PKGDIR="$REMERGE_CLIENT_DIR/pkgs"
mkdir -p $REMERGE_PKGDIR

# emerge command line
REMERGE_EMERGE="emerge \
--quiet-build y \
--buildpkg \
--buildpkg-exclude \"$REMERGE_EXCLUDE\" \
"
