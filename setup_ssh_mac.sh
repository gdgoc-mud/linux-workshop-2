#!/bin/bash

echo "================================"
echo " SSH Workshop Setup (macOS)"
echo "================================"
echo

# Install Homebrew if not present
echo "[1/3] Checking Homebrew..."
if ! command -v brew &>/dev/null; then
    echo "    Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH for Apple Silicon
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    fi
fi

echo "[2/3] Installing cloudflared..."
brew install cloudflared

if ! command -v cloudflared &>/dev/null; then
    echo "[!] cloudflared installation failed. Check your internet connection."
    exit 1
fi

echo "[3/3] Writing SSH config..."
mkdir -p ~/.ssh
touch ~/.ssh/config

if ! grep -q "trycloudflare.com" ~/.ssh/config; then
    cat >> ~/.ssh/config <<EOF

Host *.trycloudflare.com
    ProxyCommand cloudflared access ssh --hostname %h
EOF
fi

chmod 600 ~/.ssh/config

echo
echo "================================"
echo " To connect, open Terminal and run:"
echo
echo " ssh ubuntu@your-url.trycloudflare.com"
echo
echo " Password: tomato"
echo "================================"
