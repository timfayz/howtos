exit

0. Backup partition table
	gdisk
1. Backup partition
	dd / gpartimage / ddresicue
	ddrescue -f -r3 /dev/sda /dev/sdb mapfile
	ddrescue -i0 -r3(exit after 3 read errs) -n(no scrambling) -c 128(sector size) -J(reread on badblocks) -f(force) -p(preallocate) infile outfile mapfile
2. Check bad blocks
	badblocks -nv or -v /dev/sdX 2>&1 | tee -a badblock.txt
3. Check filesystem itegrity
   e2fsck -v -f /dev/sdb1 (ext)
   ntfsfix -b -d /dev/sdX1 (ntfs)
