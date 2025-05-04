sudo apt install python3 python3-pip -y
pip3 install cryptography pandas faker

# 1. Generate RSA Key Pair (rsa_key.py)
nano rsa_key.py
# Enter the following code
# Start of code
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization

# Generate private key
private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048
)

# Save private key
with open("rsa_private.pem", "wb") as f:
    f.write(private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.TraditionalOpenSSL,
        encryption_algorithm=serialization.NoEncryption()
    ))

# Generate public key
public_key = private_key.public_key()

# Save public key
with open("rsa_public.pem", "wb") as f:
    f.write(public_key.public_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PublicFormat.SubjectPublicKeyInfo
    ))

print("RSA key pair generated and saved.")
# End of code

run : python3 rsa_key.py

# 2. Encrypt Data Using RSA Public Key (rsa_encrypt.py)
nano rsa_encrypt.py
# Enter the following code
# Start of code
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives import serialization

# Load the public key
with open("rsa_public.pem", "rb") as f:
    public_key = serialization.load_pem_public_key(f.read())

# The message to encrypt
message = b"Secure Data Transfer"

# Encrypt the message using RSA public key
encrypted = public_key.encrypt(
    message,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(),
        label=None
    )
)

print(f"Encrypted Data: {encrypted}")
# End of code

run : python3 rsa_encrypt.py

# 3. Decrypt Data Using RSA Private Key (rsa_decrypt.py)
nano rsa_decrypt.py
# Enter the following code
# Start of code
from cryptography.hazmat.primitives.asymmetric import padding
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives import serialization

# Load the private key
with open("rsa_private.pem", "rb") as f:
    private_key = serialization.load_pem_private_key(f.read(), password=None)

# The encrypted message (use the result from rsa_encrypt.py)
encrypted_message = b'ENCRYPTED_MESSAGE_HERE'  # Replace with the output of python3 rsa_encrypt.py

# Decrypt the message using RSA private key
decrypted = private_key.decrypt(
    encrypted_message,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(),
        label=None
    )
)

print(f"Decrypted Data: {decrypted.decode()}")
# End of code

run : python3 rsa_decrypt.py