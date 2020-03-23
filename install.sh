#!/bin/sh

echo "Setting up..."

# Install some utilities
sudo apt update
sudo apt install -y bash bat coreutils git grep unzip curl wget build-essential apt-transport-https ca-certificates software-properties-common

# Install packages for development
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install -y nginx php7.4 php7.4-{fpm,cli,curl,gd,mbstring,mysql,zip,sqlite3,imagick} imagemagick mariadb-server redis-server
echo "Packages are installed, you can read the docs for them, to see if something needs to be configured"

# Install composer
cd ~
curl -sS https://getcomposer.org/installer -o composer-setup.php
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

# Install node and npm
cd ~
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt install -y nodejs

# Set default MySQL root password and auth type.
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer cpriego/valet-linux

# Install valet linux (see https://cpriego.github.io/valet-linux/ for setting up)
$HOME/.composer/vendor/bin/valet install

# Create apps directory
mkdir /var/www/apps

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/Documents/dotfiles/.zshrc $HOME/.zshrc

## Install applications (Be aware that some apps doesn't have a realease for your version of ubuntu)
# albert
wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_$(lsb_release -rs)/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_$(lsb_release -rs)/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
sudo apt-get update
sudo apt-get install -y albert

# chrome
cd ~
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm -rf ./google-chrome-stable_current_amd64.deb

# flameshot
sudo apt install flameshot

# grub customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt update
sudo apt install -y grub-customizer

# insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | sudo apt-key add -
sudo apt update
sudo apt install -y insomnia

# slack
cd ~
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
sudo apt install -y ./slack-desktop-*.deb
rm -rf ./slack-desktop-*.deb

# skype
cd ~
wget https://go.skype.com/skypeforlinux-64.deb
sudo apt install -y ./skypeforlinux-64.deb
rm -rf ./skypeforlinux-64.deb

# sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text sublime-merge

# tableplus
wget -O - -q http://deb.tableplus.com/apt.tableplus.com.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://deb.tableplus.com/debian tableplus main"
sudo apt update
sudo apt install -y tableplus

# teamviewer
cd ~
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb
rm -rf ./teamviewer_amd64.deb

# tor-browser
sudo add-apt-repository universe
wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt install -y tor deb.torproject.org-keyring torbrowser-launcher

# transmission
sudo add-apt-repository ppa:transmissionbt/ppa
sudo apt update
sudo apt-get install -y transmission-gtk transmission-cli transmission-common transmission-daemon

# vim (full version)
sudo apt remove -y vim-tiny
sudo apt update
sudo apt install -y vim

# vlc
sudo apt update
sudo apt install -y vlc

# zoom
cd ~
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install -y ./zoom_amd64.deb
rm -rf ./zoom_amd64.deb

echo "Done...\n"
echo "You might need to restart your computer"
