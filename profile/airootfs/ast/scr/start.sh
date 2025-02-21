#/bin/bash env
sudo pacman -Sy
echo "Installing YAY..."
git clone https://aur.archlinux.org/yay.git /opt/
cd /opt/yay
makepkg -sid --noconfirm
cd $HOME
echo "Installing AUR Packages..."
yay -S wlogout emote superfile --noconfirm
