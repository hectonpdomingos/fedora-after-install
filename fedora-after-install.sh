#!/bin/bash
#Update
dnf update -y

#Codecs

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y

dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


dnf install gstreamer1-{ffmpeg,libav,plugins-{good,ugly,bad{,-free,-nonfree}}} --setopt=strict=0 -y


#player

dnf install vlc

#groups
dnf groupupdate core -y
dnf groupupdate multimedia -y 
dnf groupupdate sound-and-video -y
dnf groupinstall "Development Tools" -y

#GIt
dnf install git-all -y

#VSCode

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update -y
dnf install code -y



#Apache
dnf install httpd -y
systemctl enable httpd.service

#Laravel env
dnf install php php-json php-common php-cli php-pdo php-mbstring php-zip php-xml -y
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

composer global require "laravel/installer"
echo 'export PATH="$PATH:$HOME/.config/composer/vendor/bin"' >> ~/.bashrc


#Database MariaDB - TO WORKON
dnf install mariadb-server -y
#http://bertvv.github.io/notes-to-self/2015/11/16/automating-mysql_secure_installation/

#2 lines after EOF
mysql_secure_installation <<EOF


secret
secret
y
y
y
y
EOF


#Nodejs

dnf install -y gcc-c++ make -y
curl -sL https://rpm.nodesource.com/setup_11.x | sudo -E bash -

dnf install nodejs -y



#Angular
npm install @angular/cli @angular/core


#teamview
wget https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm
rpm -Uvh teamviewer.x86_64.rpm

