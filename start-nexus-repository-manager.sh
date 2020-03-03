#!/bin/bash
#
# Copyright:: Copyright (c) 2017-present Sonatype, Inc. Apache License, Version 2.0.
#

cd /opt/sonatype/nexus
/usr/sbin/sshd
exec ./bin/nexus run
