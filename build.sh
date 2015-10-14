#!/bin/bash

set -e

## VLC
if ! grep -q ^avahi: /etc/group; then
  groupadd -g 214 avahi
fi
if ! grep -q ^avahi: /etc/passwd; then
  useradd -u 214 -g avahi -c Avahi -d /dev/null -s /bin/false avahi
fi
echo Y | slpkg -s sbo vlc

## Inkscape
echo Y | slpkg -s sbo inkscape

## LibreCAD
echo Y | slpkg -s sbo librecad

## FreeCAD
echo Y | slpkg -s sbo FreeCAD

## whyteboard
# libgnomeprintui is needed when building wxPython with GNOMEPRINT=yes
echo Y | slpkg -s sbo libgnomeprintui
# whyteboard needs wxPython built with GNOMEPRINT=yes
export GNOMEPRINT=yes
echo Y | slpkg -s sbo whyteboard

