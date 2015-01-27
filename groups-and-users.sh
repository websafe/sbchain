#!/bin/bash

# Create groups and users required by my slackbuild-chain.

# Copyright (c) 2014 Thomas Szteliga <ts@websafe.pl>, <https://websafe.pl/>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

## -----------------------------------------------------------------------------

# See http://slackbuilds.org/uid_gid.txt for recommended UID/GIDs.

#
set -e

# PostgreSQL
# http://slackbuilds.org/repository/14.1/system/postgresql/
if ! grep -q ^postgres: /etc/group; then
  groupadd -g 209 postgres
fi
if ! grep -q ^postgres: /etc/passwd; then
  useradd -u 209 -d /var/lib/pgsql -g postgres postgres
fi

# Dovecot
# http://slackbuilds.org/repository/14.1/network/dovecot/
if ! grep -q ^dovecot: /etc/group; then
  groupadd -g 202 dovecot
fi
if ! grep -q ^dovenull: /etc/group; then
  groupadd -g 248 dovenull
fi
if ! grep -q ^dovecot: /etc/passwd; then
  useradd -u 202 -d /dev/null -s /bin/false -g dovecot dovecot
fi
if ! grep -q ^dovenull: /etc/passwd; then
  useradd -u 248 -d /dev/null -s /bin/false -g dovenull dovenull
fi

# Postfix
# http://slackbuilds.org/repository/14.1/network/postfix/
if ! grep -q ^postfix: /etc/group; then
  groupadd -g 200 postfix
fi
if ! grep -q ^postdrop: /etc/group; then
  groupadd -g 201 postdrop
fi
if ! grep -q ^postfix: /etc/passwd; then
  useradd -u 200 -d /dev/null -s /bin/false -g postfix postfix
fi

# ClamAV
# http://slackbuilds.org/repository/14.1/system/clamav/
if ! grep -q ^clamav: /etc/group; then
  groupadd -g 210 clamav
fi
if ! grep -q ^clamav: /etc/passwd; then
  useradd -u 210 -d /dev/null -s /bin/false -g clamav clamav
fi

# davfs2
# http://slackbuilds.org/repository/14.1/system/davfs2/
if ! grep -q ^davfs2: /etc/group; then
  groupadd -g 230 davfs2
fi
if ! grep -q ^davfs2: /etc/passwd; then
  useradd -u 230 -d /var/cache/davfs2 -s /bin/false -g davfs2 davfs2
fi

