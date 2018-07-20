exit

Recommendations:
- Clear cache in Telegram, Firefox, Skype 
- Empty Trash

# backup /
tar -cpvf root-dir.tar --one-file-system --exclude-from=backup-root-exclusions.txt ./

# backup /home
tar -cpvf home-dir.tar --one-file-system --exclude-from=backup-home-exclusions.txt .*

# backup /shared
rsync -ax --progress --exclude-from=exclusion-shared.txt /mnt/shared/ /mnt/hdd/Backup/

# backup MCST/
tar -cpv --one-file-system MCST --exclude=sandbox | split -d -b 3900m - /mnt/usb/hdd/mcst-back.tar.

# backup entire drive into partition
sudo dd if=/dev/sda of=/dev/sdb1 bs=?K conv=noerror,sync status=progress # | gzip -c > path/to/drive/backup.img.gz
gunzip -c /path/to/drive/backup.img.gz | dd of=/dev/sda

