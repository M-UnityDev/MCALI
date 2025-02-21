#/bin/bash env
b=$HOME
a="/"
if [ "$a" == "$b" ]; then
	echo "Your home directory equals '/', fix that" 
	exit 1
elif [ $USER == "root" ]; then
	echo "You Can't run this as root" 
	exit 1
fi   
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Sy
echo "Installing YAY..."
echo "Cloning YAY from AUR..."
git clone https://aur.archlinux.org/yay.git $HOME/yay/ > ./MCALIGITLOGS 2>&1
cd $HOME/yay/
echo "Making and Installing YAY package..."
makepkg -sid --noconfirm > ./MCALIYAYLOGS 2>&1
cd $HOME
echo "Cleaning Up..."
rm -rf $HOME/yay/
echo "Installing AUR Packages..."
yay -S wlogout --noconfirm > ./MCALIAURLOGS 2>&1
echo "Start configuration complete, Enjoy your LiveCD instance, 
or start installation using 'bash /ast/scr/install.sh' command!"
