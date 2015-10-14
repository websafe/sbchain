#!/bin/bash

#
set -e

# VLC
if ! grep -q ^avahi: /etc/group; then
  groupadd -g 214 avahi
fi
if ! grep -q ^avahi: /etc/passwd; then
  useradd -u 214 -g avahi -c Avahi -d /dev/null -s /bin/false avahi
fi
echo Y | slpkg -s sbo vlc
