#!/bin/bash
exit

# Prepare to move
# 1. Backup!
# 2. lvresize -r -L 32G vg0/{root,..}
#    lvresize -L 6G vg0/swap && mkswap /dev/mapper/vg0-swap
# if -r present no need for: fsck && resize2fs
# 3. pvresize --setphysicalvolumesize 100G /dev/sdb2
# 4. gdisk /dev/sdb -> resize (remove and add) /dev/sdb2 accordingly

# Move data to SSD
# 1. pvcreate /dev/sdb2
# 2. vgextend vg0 /dev/sdb2
# 3. pvmove -n {lv1,lv2,..} /dev/sda2/ /dev/sdb2
# 4. vgrename vg0 old_vg0
# 5. vgsplit old_vg0 vg0 /dev/sdb2
# 6. vim /etc/fstab # check UUIDs
# 7. mount /mnt /dev/vg0/root
# 8. mount /mnt/boot/efi /dev/sdb1
# 9. sudo chroot /mnt /bin/bash
# 10. sudo rm /etc/initramfs-tools/conf.d/resume
# 11. update-grub && grub-install /dev/sdb

