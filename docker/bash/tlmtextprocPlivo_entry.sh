#!/usr/bin/dumb-init /bin/sh

tlmtextproc init
tlmtextproc adduser --username $COCKROACH_USER
tlmtextproc crons &
tlmtextproc txtplivo