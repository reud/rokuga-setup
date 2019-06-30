#!/bin/sh
echo "installing essentials"
sudo apt-get install -y vim samba ntp wget curl git make cmake zip
sudo apt-get install -y pcscd libpcsclite1 libpcsclite-dev libccid pcsc-tools
sudo apt-get install -y autoconf build-essential git-core libssl-dev libtool libboost-all-dev pkg-config yasm pkg-config
echi "install PX-S1UD driver"
mkdir ~/PX-S1UD
cd ~/PX-S1UD
wget http://plex-net.co.jp/plex/px-s1ud/PX-S1UD_driver_Ver.1.0.1.zip
unzip PX-S1UD_driver_Ver.1.0.1.zip
sudo cp PX-S1UD_driver_Ver.1.0.1/x64/amd64/isdbt_rio.inp /lib/firmware/
echo "PX-S1UD driver created"
cd ~
echo "installing libarib25"
sudo apt install autoconf automake -y
wget https://github.com/stz2012/libarib25/archive/master.zip
unzip master.zip
cd libarib25-master
cmake .
make
sudo make install
echo "installing recdvb"
wget http://www13.plala.or.jp/sat/recdvb/recdvb-1.3.1.tgz
tar xvzf recdvb-1.3.1.tgz
cd recdvb-1.3.1
./autogen.sh
./configure --enable-b25
make 
sudo make install
echo "installing nodejs and pm2"
sudo apt-get install build-essential curl git-core vainfo -y
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install pm2 -g
sudo pm2 startup
echo "installing mirakurun..."
sudo npm install mirakurun -g --unsafe-perm --production
cd /usr/local/etc/mirakurun
echo "please set a tuners.yml"
sudo nano tuners.yml
echo "- name: PX-S1UD-1" >> tuners.yml
echo "  types:" >> tuners.yml
echo "    - GR" >> tuners.yml
echo "  command: recdvb --b25 --dev 0 <channel> - -" >> tuners.yml
echo "start getting channels..."
dmesg | grep VidzMedia
sudo adduser reud video
echo "driver がロードされているか確認してください"
sudo reboot
curl -X PUT "http://localhost:40772/api/config/channels/scan"
echo "starting mirakurun..."
sudo mirakurun status
echo "installing chinachu"
git clone git://github.com/kanreisa/Chinachu.git
cd ~/Chinachu/
sudo chmod 777 /usr/local/lib
sudo chmod 777 /usr/local/lib/node_modules
sudo chown -R $USER:$GROUP ~/.npm
sudo chown -R $USER:$GROUP ~/.config
./chinachu installer
cp config.sample.json config.json
vim config.json


