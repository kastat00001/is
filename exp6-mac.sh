sudo apt install selinux-utils # if not installed

getenforce # check selinux status
sudo setenforce 1
touch confidential.txt
ls -Z confidential.txt
sudo cat /var/log/audit/audit.log

#AI

mkdir mac_demo && cd mac_demo
touch confidential.txt

sudo systemctl start apparmor && 
sudo systemctl enable apparmor

sudo nano /etc/apparmor.d/usr.bin.cat

#include <tunables/global>

/usr/bin/cat {
    # Deny access to confidential.txt
    deny /path/to/mac_demo/confidential.txt,
    # Allow access to other files
    /usr/bin/cat mr,
    /usr/share/doc/** r,
    /etc/** r,
    /var/log/** r,
    /tmp/** rw,
}

sudo apparmor_parser -r /etc/apparmor.d/usr.bin.cat

cat confidential.txt

sudo cat /var/log/syslog | grep apparmor

