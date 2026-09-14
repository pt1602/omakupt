#!/bin/bash

# Installed from JetBrains' own tarball instead of the snap, which carries
# squashfs/sandboxing overhead that shows up as slower startup for a JVM app.
cd /tmp
DOWNLOAD_URL=$(curl -s "https://data.services.jetbrains.com/products/releases?code=PS&latest=true&type=release" | grep -Po '"linux":\{"link":"\K[^"]+')
wget -O phpstorm.tar.gz "$DOWNLOAD_URL"

sudo rm -rf /opt/phpstorm
sudo mkdir -p /opt/phpstorm
sudo tar -xzf phpstorm.tar.gz -C /opt/phpstorm --strip-components=1
rm phpstorm.tar.gz

sudo ln -sf /opt/phpstorm/bin/phpstorm.sh /usr/local/bin/phpstorm

DESKTOP_FILE="/usr/share/applications/phpstorm.desktop"
sudo bash -c "cat > $DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=PhpStorm
Comment=JetBrains PHP IDE
Exec=/opt/phpstorm/bin/phpstorm.sh %f
Icon=/opt/phpstorm/bin/phpstorm.svg
Terminal=false
Type=Application
Categories=Development;IDE;
StartupWMClass=jetbrains-phpstorm
EOL
