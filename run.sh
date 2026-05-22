#!/bin/bash

read -p "Enter Domain Name: " domainName
read -p "Enter Password Name: " password
read -p "Country Name (2 Letter code) [MY]: " country
read -p "State or Province Name (full name) [Some-State]: " state
read -p "Locality Name (e.g, city) [city]: " city  
read -p "Organization Name (eg, company) [Internet Widgits Pty Ltd]: " organization
read -p "Organization Unit Name (eg, section) [IT]: " unit
commonName=$domainName
read -p "Email Address []:" emailAddress
mkdir -p outputs && cd outputs
openssl genrsa -out root_$domainName.key 2048
openssl req -x509 -new -nodes -key root_$domainName.key -sha256 -days 3650 -out $domainName.pem -subj "/C=$country/ST=$state/L=$city/O=$organization/OU=$unit/CN=$commonName/emailAddress=$emailAddress"
openssl genrsa -passout pass:$password -out $domainName.key 2048
openssl req -new -key $domainName.key -passin pass:$password -out $domainName.csr -subj "/C=$country/ST=$state/L=$city/O=$organization/OU=$unit/CN=$commonName/emailAddress=$emailAddress"
openssl x509 -req -extfile <(printf "subjectAltName=DNS:$domainName") -in $domainName.csr -CA $domainName.pem -CAkey root_$domainName.key -CAcreateserial -out $domainName.crt -days 3650 -sha256
sudo cp $domainName.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates

echo "Self signed SSL create successfully"