#!/bin/bash -e
# Copyright 2018, Development Gateway, see COPYING
if [ "$1" != "rpmbuild" ]; then
  exec "$@"
fi

find /var/rpmbuild/SPECS -type f -name '*.spec' | while read SPEC; do
  yum-builddep -y "$SPEC"
  su -c "rpmbuild -ba --clean '$SPEC'" rpm
done
