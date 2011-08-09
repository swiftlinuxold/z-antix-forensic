#!/bin/bash
# Proper header for a Bash script.

# Check for root user login
if [ ! $( id -u ) -eq 0 ]; then
	echo "You must be root to run this script."
	echo "Please enter su before running this script again."
	exit 2
fi

IS_CHROOT=0 # changed to 1 if and only if in chroot mode
USERNAME=""
DIR_DEVELOP=""

# The remastering process uses chroot mode.
# Check to see if this script is operating in chroot mode.
# /srv directory only exists in chroot mode
if [ -d "/srv" ]; then
	IS_CHROOT=1 # in chroot mode
	DIR_DEVELOP=/usr/local/bin/develop 
else
	USERNAME=$(logname) # not in chroot mode
	DIR_DEVELOP=/home/$USERNAME/develop 
fi

echo "Adding forensic packages"

apt-get install -y autopsy dcfldd foremost
apt-get install -y scalpel sleuthkit
apt-get install -y unhide vinetto
apt-get install -y bkhive chntpw dvdisaster dvdisaster-doc
apt-get install -y e2undel ext3grep gddrescue gzrt gpar2 magicrescue
apt-get install -y ophcrack ophcrack-cli recover recoverdm recoverjpeg
apt-get install -y safecopy scrounge-ntfs
apt-get install -y dares dares-qt ddrescue gddrescue myrescue
apt-get install -y partimage-doc
apt-get install -y hfsplus hfsutils jfsutils mtd-utils reiser4progs
apt-get install -y gpart readpst readpst-dbg chkrootkit john
apt-get install -y lsscsi

exit 0
