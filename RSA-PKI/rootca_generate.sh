#rootca_genrootca.sh
rootcadir=/pki/rootca
private_key=$rootcadir/private/rootca.key
certificate=$rootcadir/dircerts/rootca.crt

#TODO Maybe encryptKeywith AES2456and password
#openssl genrsa -aes256 \
#      -out intermediate/private/www.example.com.key.pem 2048

#TODO HSM

#### Generating RootCA RSA4K Private Key
openssl genpkey -algorithm RSA    \
 -out ${private_key}    \
 -pkeyopt rsa_keygen_bits:4096
 
# Only Root can read
chmod 400 ${private_key}

#### Generate Self-Signed Cert with RootCA_Cert-Config
openssl req -x509 -new                \
  -key ${private_key}     \
  -out ${certificate}      \
  -config pkiconfig.cnf \
  -extensions v3_root_ca -days 90
#-default_ca RootCA_default  \

# Only Read fore everyone
 chmod 444 ${certificate}