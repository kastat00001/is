echo "This is a untampered file" > file.txt
sha256sum file.txt 
echo "This is a false statement" >> file.txt
sha256sum file.txt

OR

sha256sum /var/log/syslog
sudo nano /var/log/syslog
# Add a new line like "Jan 1 12:00:00 UnauthorizedAccess: Admin login."
sha256sum /var/log/syslog


# thr outputs for the sha256sum should be different