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
  && yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm \
  && yum -y install yum-utils rpm-build rpm-sign autoconf make cmake gcc gcc-c++ \
  && yum clean all \
  && mkdir /var/rpmbuild/{RPMS,SOURCES,SPECS,SRPMS} \
  && chown rpm:rpm /var/rpmbuild/{RPMS,SOURCES,SPECS,SRPMS}

COPY rpmmacros /etc/rpm/macros

WORKDIR /var/rpmbuild

VOLUME /var/rpmbuild
