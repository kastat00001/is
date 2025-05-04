sudo apt update && sudo apt upgrade -y
sudo apt install nmap -y

ip a | grep "global eth0" # if this doesnt output anything remove "| grep "global eth0"
nmap -sV -p- <your ip address> # -sV:prints current used versions of the services found ; -p- : scans all 65535 ports (try not to use it as it will take a longahh time)
