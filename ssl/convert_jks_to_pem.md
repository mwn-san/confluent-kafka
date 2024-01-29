# CONVERT JKS TO PEM

```
# 1. Converting a JKS to PKCS12 keystore
#---------------------------------------#
keytool -importkeystore -srckeystore domain.com.keystore.jks -destkeystore domain.com.pfx -deststoretype pkcs12

# 2. Export public certificate from JKS in DER format (binary-encoded format)
#----------------------------------------------------------------------------#
keytool -exportcert -alias domain.com -file domain.com.crt -keystore domain.com.keystore.jks

# 3. Export public certificate from JKS in PEM format (ASCII Base64 human-readble format)
#----------------------------------------------------------------------------------------#
# Additional '-rfc' option need to be passed along with '-exportcert' option to get a pem encoded certificate
keytool -exportcert -alias domain.com -file domain.com.pem -keystore domain.com.keystore.jks -rfc

# 4. Export private key entry from JKS
#-------------------------------------#
\*
   By default, the JKS key store type doesn't support exporting the Private key entry using the key tool
   Private key entry can be exported by converting the JKS to a PKCS12 key store
   Command for converting JKS to PKCS12 key store can be found in 4
   We will use the PKCS12 key store 'sample_keystore.pfx' and export the private key entry in 'PEM' format using the following OpenSSL command
   Options:
           -nodes: No DES format so the Private key won't be encrypted
           -nocerts: No certificates will be exported at all, only the private key entry
\*
openssl pkcs12 -in domain.com.pfx -nodes -nocerts -out domain.com.private.key.pem
```

Certificate checker: https://www.sslshopper.com/certificate-key-matcher.html
