sudo adduser alice
echo "Confidential Data: Usernames and Passwords" > sensitive_file.txt
chmod 600 sensitive_file.txt
sudo cp sensitive_file.txt /home/alice/sensitive_file.txt
su - alice
cat sensitive_file.txt

#  Expected error message: "Permission denied"