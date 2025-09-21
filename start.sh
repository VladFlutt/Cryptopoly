#!/bin/bash
# Run ganache with host and port in background and save keys
sudo ganache --host 0.0.0.0 --port 8545 --account_keys_path keys.json &

# Wait 2 seconds to let ganache start and keys file be created
sudo sleep 7

# Extract keys from keys.json and generate QR codes in a loop
sudo grep -oP '"0x[a-fA-F0-9]{40}": ?"0x[a-fA-F0-9]{64}' keys.json | grep -oP '0x[a-fA-F0-9]{64}' | while read -r line; do
  qrencode -t ANSIUTF8 "$line"
done

# Wait for all background processes (ganache) to finish
wait

