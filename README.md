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
