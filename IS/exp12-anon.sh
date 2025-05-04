sudo apt install python3 python3-pip -y
pip3 install cryptography pandas faker
python3 --version
pip3 list | grep -E "cryptography|pandas|faker"

# Install Faker Library
sudo apt install faker

# Masking Sensitive Data (Anonymization) (Create nano mask.py)
nano mask.py
# Enter the following code
# Start of code
import pandas as pd

# Data containing SSNs
data = {"SSN": ["123-45-6789", "987-65-4321", "555-44-3333"]}
df = pd.DataFrame(data)

# Masking SSN (showing only the last 4 digits)
df["Masked_SSN"] = df["SSN"].str.replace(r"\d{3}-\d{2}", "***-**-", regex=True)

# Display the masked data
print(df)
# End of code

run : python3 mask.py

# Generate Fake Data (Create nano generate_fake_data.py)
nano generate_fake_data.py
# Enter the following code
# Start of code
from faker import Faker

# Create a Faker instance
fake = Faker()

# Generate and print 5 fake records
for _ in range(5):
    print(fake.name(), "-", fake.email(), "-", fake.phone_number())
# End of code

run : python3 generate_fake_data.py