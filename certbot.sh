wget https://dl.eff.org/certbot-auto
chmod a+x ./certbot-auto

./certbot-auto certonly --manual \
    --non-interactive \
    -d "$LE_DOMAIN" \
    --email "$LE_EMAIL" \
    --no-eff-email \
    --agree-tos \
    --manual-public-ip-logging-ok \
    --preferred-challenges dns \
    --manual-auth-hook ./dns.rb \
    --manual-cleanup-hook 'echo Run post hook'

echo $(ls -la /etc/letsencrypt)
echo $(ls -la /etc/letsencrypt/live/$LE_DOMAIN/)

./gitlab.sh
