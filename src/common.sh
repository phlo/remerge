# Common remerge functions and environment.

# source gentoo messaging functions
. /lib/gentoo/functions.sh

# exit unexpectedly with eventual error message
die () {
  [ ! -z "$*" ] && eerror "[$(basename $0)]" $*
  exit 1
}

# require root privileges
require_root () {
  [ "$EUID" -ne 0 ] && die "requires root access"
}
