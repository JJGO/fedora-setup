#!/bin/bash

chmod +x *.sh

sudo dnf upgrade

hostnamectl set-hostname Kartana


# Generate ssh key

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

sudo dnf install xclip

xclip -sel clip < ~/.ssh/id_rsa.pub

# Enable RPM fusion repos

sudo dnf install --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-24.noarch.rpm
sudo dnf install --nogpgcheck http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-24.noarch.rpm

# Install Fedy

curl https://www.folkswithhats.org/installer | sudo bash 

# Install Fedora Packages
sudo ./packages.sh

# Install python environments
sudo dnf install -y zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel
./python-setup.sh

# Install Ruby gems
sudo dnf -y install gcc mysql-devel ruby-devel rubygems
gem install bundler
bundle install

# Configure ZSH
./zsh-setup.sh


# DOTFILES!!

# Run post-processing script
./post-process.sh