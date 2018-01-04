mkdir -p ./certbot/config ./certbot/logs ./certbot/work

wget https://dl.eff.org/certbot-auto
chmod a+x ./certbot-auto

./certbot-auto certonly --manual \
    --non-interactive \
    -d "$LE_DOMAIN" \
    --email "$LE_EMAIL" \
    --no-eff-email \
    --agree-tos \
    --manual-public-ip-logging-ok \
    --config-dir ./certbot/config \
    --logs-dir ./certbot/logs \
    --work-dir ./certbot/work \
    --preferred-challenges dns \
    --manual-auth-hook ./dns.rb \
    --manual-cleanup-hook ./cleanup.rb

./gitlab.rb
