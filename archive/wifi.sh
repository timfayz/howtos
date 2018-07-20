sudo ip link set wlp10s0b1 up
sudo wpa_supplicant -B -c./wpa.conf -iwlp10s0b1
sudo dhcpcd
