# Rpmbuild Image for Docker

This image is for building RPM packages for RH-like systems. It includes EPEL repo for platforms
that need it, and a set of build tools:

* YUM builddep plugin to install BuildRequires dependencies automatically;
* GCC and G++;
* Autoconf, Make, and CMake.

## User

The container runs as root in order to install dependencies, and builds packages as UID 900 and
GID 900. Be advised, that `rpmbuild` will fail unless source and spec files are owned by that user,
not just readable.

## Volume

### `/var/rpmbuild`

The `%_topdir` directory. At least `SOURCES` and `SPECS` subdirectories are required, the rest will
be created as needed.

### `/tmp`

Not a real volume, but a shared directory for temporary data. The following subdirectories will be
automatically created here:

* `BUILD` - where the build process takes place, and
* `BUILDROOT` - the virtual root where the files will be installed before packaging.

It's recommended to mount a volume here. However, **be advised** that by default `tmpfs` volumes get
mounted with `noexec` flag, and scripts like `./configure` will not run. Normal volumes do not have
such limitation.

## Copyright

Copyright 2018, Development Gateway

See COPYING for details.
