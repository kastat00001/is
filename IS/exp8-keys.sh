sudo apt install openssl -y
openssl version # Verify installation

# Generating Public/Private key pairs

openssl genpkey -algorithm RSA -out user_private.key # Private Key
openssl rsa -pubout -in user_private.key -out user_public.key # Public Key

# Creation of a User Certificate

openssl req -new -key user_private.key -out user.csr # Certificate Signing Request
# When prompted, enter details like:
# Country Name: US
# Organization Name: SecureLab
# Common Name: User1
openssl x509 -req -in user.csr -signkey user_private.key -out user.crt # Self signed certificate

# Digital Signing Using Certificate Authority (CA)

openssl genpkey -algorithm RSA -out ca_private.key # Create the CA Private Key
openssl req -key ca_private.key -new -x509 -out ca_certificate.crt # Create the CA Certificate
openssl x509 -req -in user.csr -CA ca_certificate.crt -CAkey ca_private.key -CAcreateserial -out user_signed.crt # user_signed.crt is issued and signed by the CA.

# add the asked information if you want