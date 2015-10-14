#!/bin/bash

set -e

## -----------------------------------------------------------------------------
## ffmpeg
echo Y | slpkg -s sbo libass
echo Y | slpkg -s sbo libbluray
echo Y | slpkg -s sbo celt
echo Y | slpkg -s sbo libdc1394
echo Y | slpkg -s sbo decklink-sdk
echo Y | slpkg -s sbo faac
echo Y | slpkg -s sbo libfdk-aac
echo Y | slpkg -s sbo flite
echo Y | slpkg -s sbo frei0r
echo Y | slpkg -s sbo gsm
echo Y | slpkg -s sbo libiec61883
echo Y | slpkg -s sbo libavc1394
echo Y | slpkg -s sbo libilbc
echo Y | slpkg -s sbo openjpeg
echo Y | slpkg -s sbo ladspa_sdk
echo Y | slpkg -s sbo lame
echo Y | slpkg -s sbo libmodplug
echo Y | slpkg -s sbo OpenAL
echo Y | slpkg -s sbo opencore-amr
echo Y | slpkg -s sbo opencv
echo Y | slpkg -s sbo opus
if ! grep -q ^pulse: /etc/group; then
  groupadd -g 216 pulse
fi
if ! grep -q ^pulse: /etc/passwd; then
  useradd -u 216 -g pulse -d /var/run/pulse -m pulse
fi
echo Y | slpkg -s sbo pulseaudio
echo Y | slpkg -s sbo libquvi
echo Y | slpkg -s sbo rtmpdump
echo Y | slpkg -s sbo schroedinger
echo Y | slpkg -s sbo speex
echo Y | slpkg -s sbo twolame
echo Y | slpkg -s sbo vid.stab
echo Y | slpkg -s sbo libvpx
echo Y | slpkg -s sbo x264
echo Y | slpkg -s sbo x265
echo Y | slpkg -s sbo xvidcore
echo Y | slpkg -s sbo zvbi
# Additional optional (autodetected) ffmpeg dependencies are:
# jack-audio-connection-kit, libva and libvdpau.
# libffado is optional for jack-audio-connection-kit
# celt is optional for jack-audio-connection-kit
echo Y | slpkg -s sbo libffado
echo Y | slpkg -s sbo celt
echo Y | slpkg -s sbo jack-audio-connection-kit
echo Y | slpkg -s sbo libva
# graphviz is an optional dependency (for building the libvdpau docs)
echo Y | slpkg -s sbo graphviz
echo Y | slpkg -s sbo libvdpau
export ASS=yes           # |no (default: no), requires libass
export BLURAY=yes        # |no (default: no), requires libbluray
export CELT=yes          # |no (default: no), requires celt
export DC1394=yes        # |no (default: no), requires libdc1394
export DECKLINK=yes      # |no (default: no), requires decklink-sdk
export FAAC=yes          # |no (default: no), requires faac (creates non-redistributable binary)
export FDK_AAC=yes       # |no (default: no), requires libfdk-aac (creates non-redistributable binary)
export FLITE=yes         # |no (default: no), requires flite
export FREI0R=yes        # |no (default: no), requires frei0r
export GSM=yes           # |no (default: no), requires gsm
export IEC61883=yes      # |no (default: no), requires libiec61883 and libavc1394
export ILBC=yes          # |no (default: no), requires libilbc
export JP2=yes           # |no (default: no), requires openjpeg
export LADSPA=yes        # |no (default: no), requires ladspa_sdk
export LAME=yes          # |no (default: no), requires lame
export MODPLUG=yes       # |no (default: no), requires libmodplug
export OPENAL=yes        # |no (default: no), requires OpenAL
export OPENCORE=yes      # |no (default: no), requires opencore-amr
export OPENCV=yes        # |no (default: no), requires opencv
export OPENSSL=yes       # |no (default: no), creates non-redistributable binary
export OPUS=yes          # |no (default: no), requires opus
export PULSEAUDIO=yes    # |no (default: no), requires pulseaudio
export QUVI=yes          # |no (default: no), requires libquvi
export RTMP=yes          # |no (default: no), requires rtmpdump
export SCHROEDINGER=yes  # |no (default: no), requires schroedinger
export SPEEX=yes         # |no (default: no), requires speex
export TWOLAME=yes       # |no (default: no), requires twolame
export VIDSTAB=yes       # |no (default: no), requires vid.stab
export VPX=yes           # |no (default: no), requires libvpx
export X264=yes          # |no (default: no), requires x264
export X265=yes          # |no (default: no), requires x265
export XVID=yes          # |no (default: no), requires xvidcore
export ZVBI=yes          # |no (default: no), requires zvbi
echo Y | slpkg -s sbo ffmpeg
unset ASS
unset BLURAY
unset CELT
unset DC1394
unset DECKLINK
unset FAAC
unset FDK_AAC
unset FLITE
unset FREI0R
unset GSM
unset IEC61883
unset ILBC
unset JP2
unset LADSPA
unset LAME
unset MODPLUG
unset OPENAL
unset OPENCORE
unset OPENCV
unset OPENSSL
unset OPUS
unset PULSEAUDIO
unset QUVI
unset RTMP
unset SCHROEDINGER
unset SPEEX
unset TWOLAME
unset VIDSTAB
unset VPX
unset X264
unset X265
unset XVID
unset ZVBI


## -----------------------------------------------------------------------------
## VLC
if ! grep -q ^avahi: /etc/group; then
  groupadd -g 214 avahi
fi
if ! grep -q ^avahi: /etc/passwd; then
  useradd -u 214 -g avahi -c Avahi -d /dev/null -s /bin/false avahi
fi
echo Y | slpkg -s sbo vlc


## -----------------------------------------------------------------------------
## Inkscape
echo Y | slpkg -s sbo inkscape


## -----------------------------------------------------------------------------
## LibreCAD
echo Y | slpkg -s sbo librecad


## -----------------------------------------------------------------------------
## FreeCAD
echo Y | slpkg -s sbo FreeCAD


## -----------------------------------------------------------------------------
## whyteboard
# libgnomeprintui is needed when building wxPython with GNOMEPRINT=yes
echo Y | slpkg -s sbo libgnomeprintui
# whyteboard needs wxPython built with GNOMEPRINT=yes
# wxGTK needs GNOMEPRINT=yes too
export GNOMEPRINT=yes
echo Y | slpkg -s sbo wxGTK
echo Y | slpkg -s sbo whyteboard
unset GNOMEPRINT


## -----------------------------------------------------------------------------
## jdk
echo Y | slpkg -s sbo jdk


## -----------------------------------------------------------------------------
## NetBeans
echo Y | slpkg -s sbo netbeans


## -----------------------------------------------------------------------------
## LibreOffice
echo Y | slpkg -s sbo libreoffice


## -----------------------------------------------------------------------------
## LibreOffice language packs
for language in pl-PL de-DE; do
  export LOLANG=$language
  echo Y | slpkg -s sbo libreoffice-langpack
  unset LOLANG
done


