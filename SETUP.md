# SETUP
Some setup instructions and recommendations

## Display Manager
setup a display manager

```
sudo systemctl enable sddm.service
sudo systemctl start sddm.service
```

## NTP

edit `/etc/chrony.conf` and set some time servers

systemd for chrony

```
sudo systemctl enable chronyd.service
sudo systemctl start chronyd.service
```

## Fonts
use this reddigt guide [here](https://www.reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily/)

## crond
start a cron daemon `sudo systemctl enable cronie.service`

## snapper
when using btrfs make use of the snapshots
```
snapper make-config <subvol>
```

## vimrc
setup vimrc for root with
```
filetype indent plugin on
syntax enable
set term=xterm-256color
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set list
set listchars=tab:>-,trail:.,space:·
set nrformats="bin,hex"
set termguicolors
```

## pacman / makepkg
to speedup things when installing from the AUR use the following [guide](https://wiki.archlinux.org/index.php/makepkg#Improving_compile_times)

## Laptop
to save power one might want to use TLP

```
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
```

and check the status for _recommendations_

```
sudo tlp-stat
```

### libinput
configure libinput for your needs

### BTRFS
for btrfs set `SATA_LINKPWR_ON_BAT="max_performance"`

