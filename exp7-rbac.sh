sudo adduser alice # if not present

sudo groupadd managers
sudo usermod -aG managers alice # -a:append ; G: group

sudo touch /home/alice/manager_notes.txt
sudo chown :managers /home/alice/manager_notes.txt
sudo chmod 660 /home/alice/manager_notes.txt

cat /home/alice/manager_notes.txt # permission denied

su alice
cat /home/alice/manager_notes.txt # no error