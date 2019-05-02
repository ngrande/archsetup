echo "Creating some directories for a n1ce workflow"
# ok so far this is only one...
mkdir ~/projects


echo "Installing packages using pacman"
sudo pacman -S $(cat package_list) --needed

echo "Installing yay (aur helper)"
echo "Confirm with [ENTER]"
read

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

echo "Now installing aur packages using yay"
yay -S $(cat aur_list) --needed
