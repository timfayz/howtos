exit

# Recommendations:
# - Clear cache in Telegram, Firefox, Skype
# - Empty Trash

# Backup /
# add -z to compress
# use `.*` instead / to start back .folders only
# add `| split -d -b 3900m - /backup.tar.` to split
# add `--exclude=root.tar` to not backing up ourselves
sudo tar -cvpf root.tar --one-file-system --exclude=root.tar --exclude-from=exclusions.txt /

# Backup using rsync
rsync -ax --progress --exclude-from=exclusion-shared.txt source/ dest/

# Backup entire drive into partition
sudo dd if=/dev/sda of=/dev/sdb1 bs=?K conv=noerror,sync status=progress # | gzip -c > path/to/drive/backup.img.gz
gunzip -c /path/to/drive/backup.img.gz | dd of=/dev/sda

# Backup/Move LVM to new drive
1. Backup the whole thing: Timeshift, GNOME disk utility, dd or tar
2. Shrink LVM volumes: shrink LV (+resize2fs or -r) -> PV -> partition
3. Migrate (/dev/sdb2 is new drive, a is old)
	1. gdisk on new drive -> mimic layout of old drive
	2. pvcreate /dev/sdb2
	3. ... rewrite notes
