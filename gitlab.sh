CERT_PEM=$(cat /etc/letsencrypt/live/$LE_DOMAIN/cert.pem)
KEY_PEM=$(cat /etc/letsencrypt/live/$LE_DOMAIN/privkey.pem)

curl --request PUT \
    --header "PRIVATE-TOKEN: $GITLAB_TOKEN" \
    --form="certificate=$CERT_PEM" \
    --form="key=$KEY_PEM" \
    https://gitlab.com/api/v4/projects/$GITLAB_USERNAME%2F$GITLAB_PROJECT/pages/domains/$LE_DOMAIN
