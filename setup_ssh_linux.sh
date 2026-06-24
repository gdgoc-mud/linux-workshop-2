#!/bin/bash

echo "================================"
echo " SSH Workshop Setup (Linux)"
echo "================================"
echo

# Detect distro and install cloudflared
echo "[1/3] Installing cloudflared..."

if command -v apt &>/dev/null; then
    curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
        -o /tmp/cloudflared
    sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
    sudo chmod +x /usr/local/bin/cloudflared

elif command -v pacman &>/dev/null; then
    if command -v yay &>/dev/null; then
        yay -S cloudflared --noconfirm
    elif command -v paru &>/dev/null; then
        paru -S cloudflared --noconfirm
    else
        curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
            -o /tmp/cloudflared
        sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
        sudo chmod +x /usr/local/bin/cloudflared
    fi

elif command -v dnf &>/dev/null; then
    curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
        -o /tmp/cloudflared
    sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
    sudo chmod +x /usr/local/bin/cloudflared

else
    echo "[!] Could not detect package manager. Installing binary directly..."
    curl -sL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
        -o /tmp/cloudflared
    sudo mv /tmp/cloudflared /usr/local/bin/cloudflared
    sudo chmod +x /usr/local/bin/cloudflared
fi

if ! command -v cloudflared &>/dev/null; then
    echo "[!] cloudflared installation failed. Check your internet connection."
    exit 1
fi

echo "[2/3] Writing SSH config..."
mkdir -p ~/.ssh
touch ~/.ssh/config

if ! grep -q "trycloudflare.com" ~/.ssh/config; then
    cat >> ~/.ssh/config <<EOF

Host *.trycloudflare.com
    ProxyCommand cloudflared access ssh --hostname %h
EOF
fi

chmod 600 ~/.ssh/config

echo "[3/3] Done."
echo
echo "================================"
echo " To connect, run:"
echo
echo " ssh ubuntu@your-url.trycloudflare.com"
echo
echo " Password: tomato"
echo "================================"
