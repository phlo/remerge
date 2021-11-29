# remerge

* authentication: ssh pubkey (root)

## Client

Requires:
* the root user's SSH key being added to the server's `authorized_keys` file
* `/etc/portage/repos.conf/gentoo.conf` pointing to the [local Gentoo repository mirror](https://wiki.gentoo.org/wiki/Local_Mirror) on the server
* the server being configured as the [SSH based binary package host](https://wiki.gentoo.org/wiki/Binary_package_guide#SSH_binary_package_host)

## Server

Requires:
* chroot environments for replicating each client's portage configuration under `/var/cache/remerge/`
