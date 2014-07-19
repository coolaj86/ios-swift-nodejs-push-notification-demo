#!/bin/bash
CERT="${HOME}/HelloWorldSwift/aps_development.cer"
KEY="${HOME}/HelloWorldSwift/Certificates-AJ-ONeal-Dev-Key-Private.p12"
openssl x509 -in "${CERT}" -inform DER -outform PEM -out cert.pem
openssl pkcs12 -in ${KEY} -out key.pem -nodes
