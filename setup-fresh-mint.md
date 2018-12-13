# Linux Mint Setup

## Packages
```
apt upgrade
```

### Tools
* git
* dconf-editor
* xclip (for tmux clipboard)
* djview4
* build-essentials
* neovim:
```
# install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
* python:
```
apt install python-pip python-setuptools python-whee
apt install python3-pip python3-setuptools python3-wheel
```
* clang-format (for vscode formatter)
* LaTeX:
```
sudo apt install texlive-latex-recommended texlive-pictures texlive-latex-extra texlive-bibtex-extra texlive bibel
```

### Apps
* vscode (external):
```
see https://code.visualstudio.com/docs/setup/linux
```
   - Sync `settings.json` from git
   - Set python path to `python3`
* telegram-desktop
* dropbox
* playonlinux
* vlc

## Configuration
* Nemo ->
	- View -> [] Show toolbar
    - Prefs -> Views ->
        * Icon View Defaults -> Zoom = 66%
        * View new folders = List view
    - org.nemo.desktop vertical-grid-adjust 0.8

* System Settings ->
	- Hot corners
	- Set compose key
	- Add lang layouts & chache switch keys
	- Disable second monitor
	- Suspend on battery
	- Disable system sounds
	- Shortcuts: switch worspaces, move to ws, run terminal & browser
	- Window tiling: maximize on top, steal focus off
	- Worspaces: cycling on
	- Effects off
	- Login: disable guests, change GTK themes, disable idicators on login, disable grid
	- Configure weekly backup
	- Appearance: change theme to Mint-Y
	- Change start menu icon & change firefox icon
	- Smash startup apps

* Optimize SSD (https://sites.google.com/site/easylinuxtipsproject/ssd)
	- leave 20% space at the end of drive (and each partition!) for overprovisioning (and fragmentation avoid!)
	- limit swappiness to 1
	- limit Firefox write overhead
	- set `fstrim` to once a day
	- set scheduler to `deadline`
```
```
* Speedup Mint (https://sites.google.com/site/easylinuxtipsproject/3)
```
#  General
Disable compositing for full-screen windows: ON
# vim /etc/bluetooth/main.conf
AutoEnable=false
# Put /tmp on tmpfs
sudo cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/
sudo systemctl enable tmp.mount
systemctl status tmp.mount
# /etc/initramfs-tools/conf.d/resume
RESUME=NONE or comment it
```
* Remove btrfs
```
sudo apt purge btrfs-progs btrfs-tools
sudo update-initramfs -ukall (optional)
```
* Change Wi-Fi driver
```
vim /etc/modprobe.d/local-b43.conf
# Activate experimental support for some hardware revisions
options b43 allhwsupport=1

sudo apt-get install firmware-b43-installer
```
* Speedup password promt fail
```
vim /etc/pam.d/login
pam_faildelay.so delay=...
```
