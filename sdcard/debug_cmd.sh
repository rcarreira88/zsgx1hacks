#!/bin/sh
#

cp /mnt/group /etc/group

# install updated version of busybox
cp /bin/busybox /bin/busybox-orig
cp /mnt/busybox-armv6l /bin/busybox
/bin/busybox --install -s

# setup and install dropbear ssh server
cp /mnt/dropbearmulti /bin/dropbearmulti
mkdir /etc/dropbear
cp /mnt/dropbear_ecdsa_host_key /etc/dropbear/dropbear_ecdsa_host_key
/bin/dropbearmulti dropbear

# update hosts file to prevent communication
cp /mnt/hosts.new /etc/hosts

# update the time
ntpd -q -p uk.pool.ntp.org

# wifi creds - currently doesn't work
#cp /mnt/wpa_supplicant.conf /home/wpa_supplicant.conf

# update wifi creds - currently doesn't work
#(sleep 20 && /mnt/mmc01/0/goke_p2pcam_param --wifissid=SSID --wifipass=WIFIPASSKEY ) &

# turn off high pitched noise
(sleep 20 && /mnt/mmc01/0/goke_volume -s 0 ) &
