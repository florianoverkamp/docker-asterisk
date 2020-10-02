# A debian/asterisk docker package

This docker container image will
- Build a Debian container (currently buster)
- Install Asterisk (currently 16)
- If no configuration is available in /etc/asterisk, clone default post-install configs
- For convenient reference also keep a copy in /etc/asterisk/dist
- Run it continually using supervisord

The run.sh script will rebuild the image, boot it up and exec a shell in it

