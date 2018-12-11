# Copyright 2018, Development Gateway, see COPYING
FROM scientificlinux/sl:7

ARG UID=900
ARG GID=900

RUN groupadd --gid $GID rpm \
  && useradd \
    --uid $UID \
    --gid $GID \
    --system \
    --create-home \
    --home-dir /var/rpmbuild \
    --no-log-init \
    rpm \
  && yum -y install yum-utils rpm-build rpm-sign autoconf make cmake gcc gcc-g++ \
  && yum clean all \
  && echo '%_topdir /var/rpmbuild' >/etc/rpm/macros \
  && mkdir /var/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} \
  && chown rpm:rpm /var/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}

WORKDIR /var/rpmbuild

VOLUME /var/rpmbuild
