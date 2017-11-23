sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot

sudo certbot certonly --manual \
    --non-interactive \
    -d "$LE_DOMAIN" \
    --email "$LE_EMAIL" \
    --no-eff-email \
    --agree-tos \
    --manual-public-ip-logging-ok \
    --preferred-challenges dns \
    --renew-hook ./le-hook.sh \
    --post-hook 'echo Run post hook'
