wget https://dl.eff.org/certbot-auto
chmod a+x ./certbot-auto

./certbot-auto certonly --manual \
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
