#!/usr/bin/zsh

set -e 			# Exit on error
set -o pipefail # Exit on pipe error
set -x 			# Enable verbosity
 cd
# Install Package Control
SUBL_ROOT="$HOME/.config/sublime-text-3"
curl 'https://packagecontrol.io/Package%20Control.sublime-package' -o "$SUBL_ROOT/Installed Packages/Package Control.sublime-package"

# Clone my sublime settings into the User folder
rm -rf "$SUBL_ROOT/Packages/User"
git clone "https://github.com/JJGO/sublime-settings" "$SUBL_ROOT/Packages/User"


### Wineconfig ###

winetricks corefonts
winetricks settings fontsmooth=rgb

### TMUXINATOR ###
MUX_COMPLETION="$HOME/.gem/ruby/gems/tmuxinator-0.9.0/completion"
mkdir -p ~/.bin/
cp "$MUX_COMPLETION/tmuxinator.bash" ~/.bin/
cp "$MUX_COMPLETION/tmuxinator.zsh"  ~/.bin/
cp "$MUX_COMPLETION/tmuxinator.fish" ~/.bin/
mkdir -p ~/.config/fish/completions/
cp ~/.bin/tmuxinator.fish ~/.config/fish/completions/

# Gnome Tweak Tool

sudo dnf copr enable -y region51/chrome-gnome-shell
sudo dnf install -y chrome-gnome-shell