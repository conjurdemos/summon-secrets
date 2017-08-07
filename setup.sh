#!/usr/bin/env bash
set -eo pipefail

conjur authn login admin
conjur policy load --as-group security_admin policy/Conjurfile

echo -e "\n\nCreating a self signed certificate..."
{
  openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
  openssl rsa -passin pass:x -in server.pass.key -out server.key
  echo -e "US\nMA\nNewton\nCyberArk\nws.local\nadmin@ws.local\n\n\n" | openssl req -new -key server.key -out server.csr
  openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
}

echo -e "\n\nPopulating variables..."
{
  cat server.crt | conjur variable values add weather_service/ssl/certificate
  cat server.key | conjur variable values add weather_service/ssl/private_key
}

echo -e "\n\nCleaning up..."
{
  rm server.pass.key server.key server.csr server.crt
}

echo -e "\n\nDone!\n\nYou can now run the weather service using summon.\nsummon bin/weather-service"

