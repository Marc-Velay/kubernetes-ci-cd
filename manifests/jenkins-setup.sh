#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
exec addgroup jenkins
exec su -c "useradd jenkins -s /bin/bash -m -g $PRIMARYGRP -G $MYGROUP -G jenkins"
exec /sbin/setuser jenkins java -jar jenkins.war 