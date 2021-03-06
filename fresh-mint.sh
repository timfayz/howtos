exit

# Update, upgrade and install
# ============================
sudo apt upgrade
sudo apt install \
git \
htop iotop \
dconf-editor \
xclip \
build-essential \
neovim \
alacarte \ # menu editor

# Apps
# ============================
sudo apt install telegram-desktop vlc # telegram and video
# pdf/epub/djvu
sudo apt install djview4 pdfshuffler xournal okular okular-extra-backends # oxygen-icon-theme
sudo apt install viewnior # image viewver

# Skype
# ============================
wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb
sudo apt install -f

# Vim's Plug
# ============================
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python
# ============================
sudo apt install python-pip python-setuptools python-whee # v2
sudo apt install python3-pip python3-setuptools python3-wheel # v3
# Pyenv + virtualenv
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
curl https://pyenv.run | bash
source ~/.bashrc
pip install --upgrade pip
pip install virtualenv

# Yandex disk
# ============================
echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex-disk.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk

# LaTeX
# ============================
# how to remove and install
https://www.tug.org/texlive/quickinstall.html
# sudo apt install texlive-latex-recommended texlive-pictures texlive-latex-extra texlive-bibtex-extra texlive latexmk
sudo apt install perl-tk tk
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz # last version of texlive (tl)
tar -xzf install-tl-unx.tar.gz
cd install..
sudo ./install-tl -gui # run gui prompt
sudo apt purge biber # remove local (old) version
# choose minimal-scheme (installs collection-basic), a4, create symlinks
tlmgr update --self

# resolve package dependencies automatically
texliveonfly -c lualatex main.tex

# to dump installed packages
tlmgr list --only-installed > installed_texlive_packages.txt

# useful commands to remember
tlmgr update --all
tlmgr check # check integrity
tlmgr option show # list options
tlmgr info # list all packages (synonyms list, show)
tlmgr info collections | schemes # list collections and schemes
tlmgr info --data depends pkg # list dependencies of pkg
tlmgr info file.sty

# urw-garamond (math font) installation
https://tex.stackexchange.com/a/20068/137390
# also see getnonfreefonts installtion
sudo su -p
getnonfreefonts --sys garamond

# LibreOffice
# ============================
sudo apt-get install libreoffice-style-sifr
# then Tools -> Options... -> View -> Icon theme -> sifr

# Qt5 apps appearence
# ============================
sudo apt install breeze # icons and theme
qt5ct --platformtheme qt5ct

# Screen recorder
# ============================
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

# VSCode
# ============================
# - https://code.visualstudio.com/download
# - sync `settings.json` from git
# - set python path to `python3`
sudo dpkg -i code_xxx.deb
sudo apt-get install -f
sudo apt install clang-format lldb

# Change Wi-Fi driver
# ============================
# (do not work) sudo apt install firmware-b43-installer
sudo apt install bcmwl-kernel-source
sudo modprobe -r b43 ssb wl
sudo modprobe wl # check which driver in use lspci -k
# - Activate experimental support for some hardware revisions
vim /etc/modprobe.d/local-b43.conf
# options b43 allhwsupport=1
# - Disable power management?
sudo vim /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
# wifi.powersave = 2 -> 3

# Touchpad
# ============================
sudo apt isntall xserver-xorg-input-synaptics xserver-xorg-input-evdev
sudo apt --purge xserver-xorg-input-libinput

# Android
# ============================
sudo apt install android-tools-adb android-tools-fastboot

# Java
# ============================
sudo apt install default-jdk maven openjdk-X-source
# (manual) https://linuxize.com/post/how-to-install-apache-maven-on-ubuntu-18-04/
# (manual) https://linuxize.com/post/how-to-install-tomcat-9-on-ubuntu-18-04/

# System configuration
# ============================
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

# Speedup password prompt fail
vim /etc/pam.d/login
# pam_faildelay.so delay=...

# RESUME initramfs
sudo vim /etc/initramfs-tools/conf.d/resume
