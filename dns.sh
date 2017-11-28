apt-get install jq
jq --version

# Need to use Homebrew-installed curl on macOS
# export PATH="/usr/local/opt/curl/bin:$PATH"

CURRENT_DIR=`pwd`
cd /usr/local/src
wget https://curl.haxx.se/download/curl-7.56.1.tar.gz
tar -xvzf curl-7.56.1.tar.gz
rm *.gz
cd curl-7.56.1
./configure
make
make install
cd $CURRENT_DIR

curl --version

echo "Logging in to hover"
curl "https://www.hover.com/api/login" \
    -X POST \
    -G \
    -d "username=${HOVER_USERNAME}" \
    -d "password=${HOVER_PASSWORD}" \
    -s \
    -o /dev/null \
    --cookie "cookies.txt" \
    --cookie-jar "cookies.txt"

echo "Fetching the DNS ID"
HOVER_DNS_VALUES=$(curl "https://www.hover.com/api/domains/$CERTBOT_DOMAIN/dns" \
    -s \
    --cookie "cookies.txt" \
    --cookie-jar "cookies.txt")

DNS_ID=$(echo "$HOVER_DNS_VALUES" | jq --raw-output ".domains[] | select(.domain_name == \"$CERTBOT_DOMAIN\") | .entries[] | select(.type == \"TXT\") | .id")

echo "Updating DNS TXT text record with LE data: $LE_DATA"
curl "https://www.hover.com/api/dns/${DNS_ID}" \
    -X PUT \
    -d "content=${CERTBOT_VALIDATION}" \
    -s \
    --cookie "cookies.txt" \
    --cookie-jar "cookies.txt"

echo "Updated hover"
