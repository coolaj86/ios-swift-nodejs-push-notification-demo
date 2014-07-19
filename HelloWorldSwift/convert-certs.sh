#!/bin/bash

APNS_DEV_CERT="Certificates-Apple-Development-IOS-Push-Services-com.coolaj86.push-demo.p12"
APNS_DEV_KEY="Certificates-AJ-ONeal-Dev-Key-Private.p12"

echo " "
echo "You will be asked for your cert password. If you didn't set one, just hit enter."
openssl pkcs12 -clcerts -nokeys -out apns-dev-cert.pem -in "${APNS_DEV_CERT}"

echo " "
echo "You will be asked for your key password. If you didn't set one, just hit enter."
echo "You will also be asked to create a passphrase (which we'll promptly remove in just a moment)."
openssl pkcs12 -nocerts -out apns-dev-key.pem -in "${APNS_DEV_KEY}"

# to remove passphrase
echo " "
echo "Now you must enter the passphrase you just created to remove it"
openssl rsa -in apns-dev-key.pem -out apns-dev-key-noenc.pem

cat apns-dev-cert.pem apns-dev-key-noenc.pem > apns-dev.pem
