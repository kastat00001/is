# Confidentiality

sudo adduser alice
echo "Confidential Data: Usernames and Passwords" > sensitive_file.txt
chmod 600 sensitive_file.txt
sudo cp sensitive_file.txt /home/alice/sensitive_file.txt
su - alice
cat sensitive_file.txt

#  Expected error message: "Permission denied"

# Availability

# check if python3 is installed, if not then
sudo apt install python3
sudo apt install apache2-utils # install apache

python3 -m http.server 8080 # Ctrl+c to end
ab -n 1000 -c 100 http://localhost:8080/

# -n: Total number of requests.
# -c: Number of concurrent requests.