exit 

# Update repos and upgrade
sudo apt upgrade

# Utilities
sudo apt install \
git \
htop iotop \
dconf-editor \
xclip \
djview4 \
build-essential \
neovim

# Vim's Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python
sudo apt install python-pip python-setuptools python-whee # v2
sudo apt install python3-pip python3-setuptools python3-wheel # v3

# LaTeX
sudo apt install texlive-latex-recommended texlive-pictures texlive-latex-extra texlive-bibtex-extra texlive latexmk

# LibreOffice
sudo apt-get install libreoffice-style-sifr
# then Tools -> Options... -> View -> Icon theme -> sifr

# PDF
sudo apt install evince pdfshuffler xournal

# vscode 
# - https://code.visualstudio.com/download
# - sync `settings.json` from git
# - set python path to `python3`
sudo dpkg -i code_xxx.deb
sudo apt-get install -f
sudo apt install clang-format

# Apps
sudo apt install \
telegram-desktop \
dropbox \
playonlinux \
vlc

# System configuration
# Nemo
# 	- View -> [] Show toolbar
#     - Prefs -> Views ->
#         * Icon View Defaults -> Zoom = 66%
#         * View new folders = List view
#     - org.nemo.desktop vertical-grid-adjust 0.8

# System Settings
# 	- Hot corners
# 	- Set compose key
# 	- Add lang layouts & chache switch keys
# 	- Disable second monitor
# 	- Suspend on battery
# 	- Disable system sounds
# 	- Shortcuts: switch worspaces, move to ws, run terminal & browser
# 	- Window tiling: maximize on top, steal focus off
# 	- Worspaces: cycling on
# 	- Effects off
# 	- Login: disable guests, change GTK themes, chose default monitor, disable idicators on login, disable grid
# 	- Configure weekly backup
# 	- Appearance: change theme to Mint-Y
# 	- Change start menu icon & change firefox icon
# 	- Smash startup apps
# 	- Disable automatic screen rotation

# Optimize SSD (https://sites.google.com/site/easylinuxtipsproject/ssd)
# 	- leave 20% space at the end of drive (and each partition!) for overprovisioning (and fragmentation avoid!)
# 	- limit swappiness to 1
sudo vim /etc/sysctl.conf
# vm.swappiness=1
# 	- limit Firefox write overhead
# 	- set `fstrim` to once a day
# 	- set scheduler to `deadline`
sudo vim /etc/default/grub
# GRUB_CMDLINE_LINUX_DEFAULT="elevator=deadline quiet splash"
#  	- set noatime
sudo vim /etc/fstab
# add noatime to all ext4 partitions

# Speedup Mint (https://sites.google.com/site/easylinuxtipsproject/3)
# - Disable compositing for full-screen windows: ON
vim /etc/bluetooth/main.conf
# AutoEnable=false
# - Move /tmp to tmpfs
sudo cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/
sudo systemctl enable tmp.mount
sudo systemctl status tmp.mount
# - Disable hibernation?
sudo vim /etc/initramfs-tools/conf.d/resume
RESUME=NONE # or comment it

# Remove btrfs
sudo apt purge btrfs-progs btrfs-tools
sudo update-initramfs -ukall (optional)

# Change Wi-Fi driver
sudo apt-get install firmware-b43-installer
# - Activate experimental support for some hardware revisions
vim /etc/modprobe.d/local-b43.conf
# options b43 allhwsupport=1
# - Disable power management?
sudo vim /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
# wifi.powersave = 2 -> 3

# Speedup password prompt fail
vim /etc/pam.d/login
# pam_faildelay.so delay=...
