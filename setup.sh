echo "Installing packages using pacman"
sudo pacman -S $(cat package_list) --needed

pacman -Q yay
yay_installed=$?
if [ $yay_installed != 0 ]; then
	echo "Installing yay (aur helper)"
	echo "Confirm with [ENTER]"
	read
	pushd .
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	popd
	rm -rf yay
fi

echo "Now installing aur packages using yay"
yay -S --needed  $(cat aur_list)
