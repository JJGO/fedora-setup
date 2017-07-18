#!/bin/bash

set -e          # Exit on error
set -o pipefail # Exit on pipe error
set -x          # Enable verbosity

## Packages

sudo dnf -y copr enable dperson/neovim
sudo dnf -y copr enable carlgeorge/ripgrep
sudo dnf -y copr enable baoboa/cmatrix
sudo dnf -y copr enable rabiny/albert

### GIT
sudo dnf install -y git
sudo dnf install -y git-extras

### SHELLS
sudo dnf install -y bash
sudo dnf install -y bash-completion
sudo dnf install -y fish
sudo dnf install -y zsh




### System
sudo dnf install -y gnome-tweak-tool


### DEVELOPMENT

sudo dnf install -y gcc
sudo dnf install -y ruby
sudo dnf install -y rubygems
sudo dnf install -y rubygem-bundler
sudo dnf install -y lua
sudo dnf install -y perl
sudo dnf install -y perl-LDAP
sudo dnf install -y java
sudo dnf install -y scala
sudo dnf install -y sbt
sudo dnf install -y node
sudo dnf install -y npm
sudo dnf install -y ghc
sudo dnf install -y haskell-platform
sudo dnf install -y erlang
sudo dnf install -y golang
sudo dnf install -y julia
sudo dnf install -y R
sudo dnf install -y rust

sudo dnf install -y rpmdevtools

sudo dnf install -y docker
sudo dnf install -y vagrant

sudo dnf groupinstall -y "Development Tools"
sudo dnf groupinstall -y "C Development Tools and Libraries"
sudo dnf install -y @virtualization

sudo dnf install -y mono-core
sudo dnf install -y mono-devel
sudo dnf install -y mono-locale-extras
sudo dnf install -y libcurl-devel

## EDITORS
sudo dnf install -y vim
sudo dnf install -y emacs
sudo dnf install -y nano

    # Sublime Text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install sublime-text

    # Neovim
sudo dnf -y install neovim
sudo dnf -y install python3-neovim python3-neovim-gui


### User CLI programs

sudo dnf install -y ack                     # Better grep
sudo dnf install -y aria2                   # CLI downloader with torrent support
sudo dnf install -y atool                   # A script for managing file archives (aunpack)
sudo dnf install -y aspell                  # Spell checker
sudo dnf install -y borgbackup              # Deduplicating backup tool
sudo dnf install -y cloc                    # Count lines of code
sudo dnf install -y cmus                    # Terminal music player
sudo dnf install -y colordiff               # Colored diff
sudo dnf install -y dos2unix                # Translate newlines between DOS and UNIX
sudo dnf install -y elinks                  # CLI web browser
sudo dnf install -y fasd                    # Fasd offers quick access to files and directories
sudo dnf install -y fdupes                  # CLI duplicate finder
sudo dnf install -y graphviz                # Graph visualization software
sudo dnf install -y hub                     # Perform GitHub actions from the CLI
sudo dnf install -y htop                    # Display system usage
sudo dnf install -y ImageMagick             # Good image editing software
sudo dnf install -y irssi                   # IRC Client
sudo dnf install -y mediainfo              # Media info for videos
sudo dnf install -y minicom                 # Serial port communication
sudo dnf install -y mkvtoolnix              # Mkv tools
sudo dnf install -y mutt                    # Email Client
sudo dnf install -y ncdu                    # Storage analyzer
sudo dnf install -y nmap                    # Network management package
sudo dnf install -y pandoc                  # Document conversion
sudo dnf install -y pass                    # UNIX password manager based on gpg
sudo dnf install -y plowshare               # Direct media downloader
sudo dnf install -y pv                      # Monitor the progress of data through a pipe.
sudo dnf install -y ranger                  # Console file manager with VI key bindings
sudo dnf install -y reptyr                  # Attach running process to new terminal
sudo dnf install -y ripgrep                 # Search similar to ag but faster
sudo dnf install -y tig                     # text-mode interface for git
sudo dnf install -y thefuck                 # To correct mistypes in commands
sudo dnf install -y the_silver_searcher     # Search similar to ack but faster
sudo dnf install -y tmux                    # Terminal multiplexer and server
sudo dnf install -y trash-cli               # To use OS trash instead of rm forever
sudo dnf install -y unison240-text          # Sync both ways folders
sudo dnf install -y youtube-dl              # Download YouTube (and others) from CLI

sudo dnf install -y wine                    # Windows program "emulator"
sudo dnf install -y winetricks              # Wine addons

sudo dnf install -y speedtest-cli           # Speedtest on CLI

## MISC
sudo dnf install -y cowsay
sudo dnf install -y fortune-mod
sudo dnf install -y fortune-firefly
sudo dnf install -y figlet
sudo dnf install -y screenfetch
sudo dnf install -y sl
sudo dnf install -y gti

sudo dnf install -y powerline
sudo dnf install -y powerline-fonts


### User GUI programs
sudo dnf install -y albert                  # Like macOS alfred
sudo dnf install -y calibre                 # Ebook management tool
sudo dnf install -y chromium                # Open Source Chrome browser
sudo dnf install -y dropbox                 # Dropbox daemon
sudo dnf install -y gimp                    # Image Editing
sudo dnf install -y inkscape                # Vectorial Editor
sudo dnf install -y keepass                 # GUI password manager
sudo dnf install -y kodi                    # Media center for music, tvshows and movies
sudo dnf install -y pinta                   # MSPaint on Linux
sudo dnf install -y playonlinux             # Wine Wrapper
sudo dnf install -y redshift                # Like Flux (yellow light)
sudo dnf install -y stow                    # Symlink utility
sudo dnf install -y shutter                 # Screenshot editor
sudo dnf install -y thunderbird             # Email client
sudo dnf install -y tor                     # Tor ring anomization
sudo dnf install -y transmission            # Torrent client
sudo dnf install -y unzip                   # unpack utility
sudo dnf install -y vlc                     # Media player

sudo dnf install -y okular                  # Pdf viewer
sudo dnf install -y pdfshuffler             # Pdf Merger/Splitter

### OTHER

cd /tmp/

# Texlive installation
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xvf install-tl-*
cd install-tl-*
echo "I" | ./install-tl
cd ..
rm -r install-tl-*


# Rclone installation
wget https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone*.zip
cd rclone-v*

sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone

sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
cd ..
rm -r rclone*

# Peco installation
# Simplistic interactive CLI filtering tool
wget https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_arm64.tar.gz
tar -xvf peco_linux_arm64.tar.gz
cd peco_linux_arm64/
sudo cp peco /usr/bin/
sudo chown root:root /usr/bin/peco
sudo chmod 755 /usr/bin/peco
cd ..
rm -r peco*

# Install veracrypt
wget https://launchpad.net/veracrypt/trunk/1.19/+download/veracrypt-1.19-setup.tar.bz2
tar -xvf veracrypt-*
./veracrypt-1.19-setup-console-x64
rm -r veracrypt-*

# Add git-lfs repo
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
sudo dnf install git-lfs
git lfs install

# Git crypt
git clone https://github.com/AGWA/git-crypt.git
cd git-crypt
make
make ENABLE_MAN=yes
make ENABLE_MAN=yes install
cd ..

#archey
wget https://github.com/downloads/djmelik/archey/archey-0.2.6-6.noarch.rpm
sudo dnf install -y archey-*
rm archey-*

# Plowdown
plowmod --install

#Gnome Pomodoro
cd /etc/yum.repos.d/
sudo wget http://download.opensuse.org/repositories/home:kamilprusko/Fedora_24/home:kamilprusko.repo
sudo dnf install gnome-pomodoro


#Jackett
mkdir -p "$HOME/bin"
cd "$HOME/bin"
wget https://github.com/Jackett/Jackett/releases/download/v0.7.1483/Jackett.Binaries.Mono.tar.gz
tar -xvf Jackett.Binaries.Mono.tar.gz
cd
