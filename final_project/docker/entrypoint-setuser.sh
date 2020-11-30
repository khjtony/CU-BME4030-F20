#!/usr/bin/env bash
#
# entrypoint-setuser.sh
#
if [[ "$(id -u)" == "0" ]]; then
  groupadd $MYGROUP -g $MYGID
  useradd -m $MYUSER -u $MYUID -g $MYGID -d /home/user -s /bin/bash
  chown -R $MYUSER:$MYGROUP /home/user
  su - $MYUSER
else
  exec $@
fi