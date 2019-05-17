#!/bin/sh

# Script to install most important packages

if ! [ -d ~/projects ];
then
	echo "Creating a projects dir for a n1ce workflow"
	mkdir ~/projects
fi

check_list() {
	local res=""
	list="$(cat $1)"
	for pkg in $list
	do
		# check if package is installed
		pacman -Q $pkg &> /dev/null
		if [[ $? -ne 0 ]];
		then
			# check if it is a group
			pacman -Qg $pkg &> /dev/null
			if [[ $? -eq 0 ]];
			then
				continue
			fi
			res="$res $pkg"
		fi
	done

	echo $res
}

install() {
	installer=$1
	list=$2
	echo "Installing packages with $installer: $(echo $list)"

	if [ "$list" == "" ];
	then
		echo "Nothing to install"
		return
	fi

	echo "Installing: $(echo $list)"
	$installer -S --needed $list
}

echo "Collecting arch repository packages to install..."
pac_list=$(check_list package_list)
install "sudo pacman" "$pac_list"

pacman -Q yay
if [ $? -ne 0 ]; then
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

echo "Collecting AUR packages to install..."
aur_list=$(check_list aur_list)
install yay "$aur_list"
