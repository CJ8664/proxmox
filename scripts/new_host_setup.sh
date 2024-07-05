# Install the essentials
apt install git vim curl sudo dpkg wget zsh -y

# Schedule automatic updates
apt install unattended-upgrades -y
dpkg-reconfigure --priority=low --frontend noninteractive unattended-upgrades

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<< y