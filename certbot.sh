echo 'deb http://ftp.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
apt-get update
apt-get install -y python-certbot-apache -t jessie-backports

certbot certonly --manual \
    --dry-run \
    --non-interactive \
    -d "$LE_DOMAIN" \
    --email "$LE_EMAIL" \
    --no-eff-email \
    --agree-tos \
    --manual-public-ip-logging-ok \
    --preferred-challenges dns \
    --renew-hook ./dns.sh \
    --post-hook 'echo Run post hook'
