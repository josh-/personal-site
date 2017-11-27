apt-get update
add-apt-repository ppa:certbot/certbot
apt-get -y install certbot

sudo certbot certonly --manual \
    --non-interactive \
    -d "$LE_DOMAIN" \
    --email "$LE_EMAIL" \
    --no-eff-email \
    --agree-tos \
    --manual-public-ip-logging-ok \
    --preferred-challenges dns \
    --renew-hook ./dns.sh \
    --post-hook 'echo Run post hook'
