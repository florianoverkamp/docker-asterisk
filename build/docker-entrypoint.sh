#!/bin/bash
set -e

# Asterisk configuration files live in /etc/asterisk but a clean post-install config has been copied to /etc/asterisk-skel
# Initialize the asterisk configuration volume if nessecary
if [[ ! -f "/etc/asterisk/asterisk.conf" ]]; then
  cp -an /etc/asterisk-skel/* /etc/asterisk
fi

# For convenience, also provide a 'dist' config folder for reference :-)
mkdir -p /etc/asterisk/dist
cp -a /etc/asterisk-skel/* /etc/asterisk/dist

# Ensure asterisk can read the files, but the volume owner can write to them
chown -R `stat -c "%u.%g" /etc/asterisk` /etc/asterisk
chmod -R go+r /etc/asterisk

echo "$@"
# Start asterisk through supervisord
exec "$@"
