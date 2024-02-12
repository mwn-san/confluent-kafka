## Create Private Key for CA:
openssl genrsa -out ca.key 2048

## Create Root Certificate (self-signed):
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.pem -subj "/C=ID/ST=Jakarta/L=Jakarta/O=Example Security/OU=CA/CN=Example Root CA"

## Create Private Key for Sertifikat:
openssl genrsa -out example.co.id.key 2048

## Create Certificate Signing Request (CSR):
openssl req -new -key example.co.id.key -out example.co.id.csr -subj "/C=ID/ST=Jakarta/L=Jakarta/O=Example Security/OU=IT/CN=*.example.co.id"

## Create Config file for Certificate Extension with name the example.ext:

authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.example.co.id
DNS.2 = example.co.id

## Sign the CSR with the CA (or skip this step if using an external CA):
openssl x509 -req -in example.co.id.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out example.co.id.crt -days 500 -sha256 -extfile example.ext

## Importing CA and wildcard certificates into the keystore:
openssl pkcs12 -export -in example.co.id.crt -inkey example.co.id.key -out example.co.id.p12 -name example.co.id -CAfile ca.pem -caname root -chain

## Then, import PKCS#12 into the keystore (JKS format):
keytool -importkeystore -deststorepass confluent -destkeypass confluent -destkeystore example.co.id.keystore.jks -srckeystore example.co.id.p12 -srcstoretype PKCS12 -srcstorepass confluent -alias example.co.id

## Import CA ke truststore:
keytool -import -file ca.pem -alias rootCA -keystore example.co.id.truststore.jks -storepass confluent

## I hope this helps peace "MWN".
