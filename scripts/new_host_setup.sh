# Install the essentials
apt install git vim curl sudo dpkg wget zsh -y

# Update apt 
apt update 

# Upgrade apt
apt dist-upgrade -y

# Reemove unnecessary pkgs
apt autoremove

# Schedule automatic updates
apt install unattended-upgrades -y
dpkg-reconfigure --priority=low --frontend noninteractive unattended-upgrades

# Remove csjain user
getent passwd 'csjain' > /dev/null
if [ $? -eq 0 ]; then
    userdel -r -f 'csjain'
fi

# Add csjain user
# The string is created by running `openssl passwd -6 <password>`
export PASS='$6$lz64qob6oH4Ongcz$jGz20QjmcJEZiOAJkb0JmVUiB5EkjLTAlXrlQZXi1KbUiGZdULbtxoQrYkOuhPa/uCz.KHNmSr4bwvKHN.M6Z.'
export NEWUSER='csjain'
useradd -m -p $PASS $NEWUSER

# Remove ansible user
getent passwd 'ansible' > /dev/null
if [ $? -eq 0 ]; then
    userdel -r -f 'ansible'
fi

# Add ansible user
# The string is created by running `openssl passwd -6 <password>`
export PASS='$6$pyGyOae1t4CtG2/j$ZxIXAiiEsfTJABK19NWUnvGd6u399PCoz5zpc9mI88vR7W8UsUq9F/8t1B4.qKQi24gQreigGemYYybcL77Wh.'
export NEWUSER='ansible'
useradd -m -p $PASS $NEWUSER

# Add thee users to sudo group
adduser csjain sudo
adduser ansible sudo

# Change the default shell to ZSH
chsh -s $(which zsh) csjain
chsh -s $(which zsh) ansible

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<< y