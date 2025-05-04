sudo adduser alice # only if user alice is not present 

sudo touch /home/alice/confidential.txt
chmod 600 /home/alice/confidential.txt

sudo chown alice:alice /home/alice/confidential.txt

su alice
cat /home/alice/confidential.txt

# should be able to read from alice account but not from other acc