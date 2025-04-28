sudo apt install python3 python3-pip -y
pip3 install cryptography pandas faker

nano aes_key.py
# Enter the following code
#Start of code
from cryptography.fernet import Fernet
# Generate AES key
key = Fernet.generate_key()
# Save the key in a file
with open("aes_key.key", "wb") as key_file:
    key_file.write(key)
    print(f"Generated AES Key: {key.decode()}")
#End of code

run : python3 aes_key.py

nano aes_encrypt.py
# Enter the following code
# Start of code
from cryptography.fernet import Fernet
# Load AES key
key = open("aes_key.key", "rb").read()
cipher = Fernet(key)
# Message to encrypt
message = "Confidential Data: Do not share!"
# Encrypt the message
encrypted_message = cipher.encrypt(message.encode())
print(f"Encrypted Message: {encrypted_message.decode()}")
#End of code

run : python3 aes_encrypt.py

nano aes_decrypt.py
# Enter the following code
# Start of code
from cryptography.fernet import Fernet
# Load AES key
key = open("aes_key.key", "rb").read()
cipher = Fernet(key)
# Encrypted message (replace with actual encrypted message)
encrypted_message = b'ENCRYPTED_MESSAGE_HERE' # copy the output from python3 aes_encrypt.py
# Decrypt the message
decrypted_message = cipher.decrypt(encrypted_message).decode()
print(f"Decrypted Message: {decrypted_message}")
# End of code

run : python3 aes_decrypt.py