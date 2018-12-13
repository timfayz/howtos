exit
# =======================================================================
# Arch Fresh-install
# =======================================================================
# Uncomment en_US and ru_RU UTF-8, KOI8-R
vi /etc/locale.gen

# add here installation process...

# Check /etc/fstab file

# Change host name
echo timur-laptop > /etc/hostname

# Disable beep sound
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf

# Add user
useradd -m -G wheel,audio,log -s /bin/bash timur
passwd timur

# Uncomment [multilib] section
vi /etc/pacman.conf

# Install packages
pacman -Suyy
pacman -S \
arch-install-scripts \
# X11
xorg xorg-xinit xorg-xrdb \
lxappearance \
# dev
linux-headers debootstrap \
git ruby npm ctags nasm qemu cdrkit \
lua lua-lpeg tre \
# sound drivers
alsa-utils pulseaudio ib32-libpulse lib32-alsa-plugins pulseaudio-alsa \
# networking
openssh minicom ppp \
ppp wpa_supplicant \
rp-pppoe networkmanager network-manager-applet \
# fs & mobile drivers
ntfs-3g ifuse usbmuxd libplist libimobiledevice udisks2 gvfs dosfstools \
mtpfs libmtp gvfs gvfs-mtp \
# file manager
pcmanfm unzip zip expac file-roller \
# image processing
jhead graphicsmagick feh pinta viewnior \
# user apps
gpick thunderbird transmission-gtk deadbeef libreoffice-still speedcrunch gnome-screenshot fbreader kchmviewer freetype2 \
neovim python2-neovim python-neovim \
iverilog \
#asp \

# =======================================================================
# Application-specific install
# =======================================================================
# Firefox-quantum
yaourt -S firefox-quantum

# Skype
yaourt -S skypeforlinux-bin

# Docker
sudo usermod -aG docker timur

# Debootstrap (systemd containers)
yaourt -S debian-archive-keyring gnupg1

# FLTK
pacman -S fltk

# f3 flash drive checker 
pacman -S f3

# Audacity
sudo pacman -S audacity

# WMware
sudo pacman -S gksu linux-headers fuse2 gtkmm

# Neovim
ln -s ~/.config/nvim/init.vim ~/.vimrc

# PPPoE add/replace at /etc/modprobe.d/modules.conf
alias char-major-108 ppp_generic

# Intall SASS
gem install sass # check PATH var

# Install prefixer
sudo npm install --global postcss-cli autoprefixer

# Install yaourt
git clone https://aur.archlinux.org/package-query.git && cd package-query/ && makepkg -si
cd ../ && git clone https://aur.archlinux.org/yaourt.git && cd yaourt/ && makepkg -si

# Install flash-player
git clone https://aur.archlinux.org/chromium-pepper-flash.git
cd chromium-pepper-flash && makepkg -sri

# Install GTK+ themes
#yaourt -S gtk-theme-arc-git
sudo pacman -S gnome-themes-standard

# Install briss
yaourt -S briss

# Install dropbox, dropbox-cli
yaourt -S dropbox dropbox-cli
sudo systemctl start dropbox@timur && sudo systemctl enable dropbox@timur

# Install Remote Desktop
yaourt -S chrome-remote-desktop

# Install Skype
yaourt -S skypeforlinux-bin

# Install Android environment
sudo yaourt -S android-studio
#android-sdk android-sdk-platform-tools android-sdk-build-tools
sudo su
groupadd android
sudo gpasswd -a timur android
chown -R :android /opt/android-sdk/
chmod g+w -R /opt/android-sdk/

# Install Virtualbox
sudo pacman -S virtualbox virtualbox-guest-modules-arch virtualbox-host-modules-arch
sudo vim /etc/modules-load.d/virtualbox.conf
vboxdrv
vboxnetadp
vboxnetflt
vboxpci
sudo gpasswd -a timur vboxusers
sudo vboxreload

# Install genymotion
sudo yaourt -S genymotion

# Other tools
rdesktop krdc

# Remove (?)
pacman -Run iwconfig iw netctl

# ===========================================================
# INTERESTING COMMANDS
# ===========================================================
# MOUNT USB
sudo mkdir -p /mnt/usb
sudo mount -o gid=timur,uid=timur,umask=0022 /dev/sdb1 /mnt/usb

# UPDATE WIRED NET
ls /sys/class/net
sudo systemctl restart dhcpcd@en1o.service

# CHANGE FILE/DIR OWN
find /* -type f -exec chmod +wr {} \;
find /* -type d -exec chown timur:timur {} \;

# LIST DEPS REVERSE
pactree -r nautilus

# ?
cd -
sudo su
find . -type d -print0 | xargs -0 sudo chmod 0775 # For directories
find . -type f -print0 | xargs -0 sudo chmod 0664 # For files
sudo find . -type d -exec chmod 755 {} \; && sudo find . -type f -exec chmod 644 {} \;
