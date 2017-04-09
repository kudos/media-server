sudo apt-get update
sudo apt-get install samba netatalk avahi-daemon avahi-utils slurm cryptsetup htop bwm-ng samba git smartmontools fail2ban zsh
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker jonathan
sudo cryptsetup luksOpen /dev/md0 storage
sudo mkdir /mnt/storage
sudo mount /dev/mapper/storage /mnt/storage
sudo cp ./files/etc_network_interfaces /etc/network/interfaces
sudo ifdown eth0 && sudo ifup eth0
sudo pkill dhclient
sudo smbpasswd -a jonathan
chsh -s /bin/zsh
