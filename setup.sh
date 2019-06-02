#!/bin/sh
sudo apt-get install -y vim samba ntp wget curl git make cmake zip
sudo apt-get install -y pcscd libpcsclite1 libpcsclite-dev libccid pcsc-tools
sudo apt-get install -y autoconf build-essential git-core libssl-dev libtool libboost-all-dev pkg-config yasm pkg-config
mkdir ~/PX-S1UD
cd ~/PX-S1UD
wget http://plex-net.co.jp/plex/px-s1ud/PX-S1UD_driver_Ver.1.0.1.zip
unzip PX-S1UD_driver_Ver.1.0.1.zip
sudo cp PX-S1UD_driver_Ver.1.0.1/x64/amd64/isdbt_rio.inp /lib/firmware/
sudo apt install autoconf automake -y
wget https://github.com/stz2012/libarib25/archive/master.zip
unzip master.zip
cd libarib25-master
cmake .
make
sudo make install
wget http://www13.plala.or.jp/sat/recdvb/recdvb-1.3.1.tgz
tar xvzf recdvb-1.3.1.tgz
cd recdvb-1.3.1
./autogen.sh
./configure --enable-b25
make 
sudo make install
sudo reboot

sudo apt-get install -y build-essential curl git-core libssl-dev yasm libtool autoconf python
sudo snap install node --classic --channel=8
sudo npm install pm2 -g
sudo npm install mirakurun -g --unsafe-perm --production

curl -X PUT "http://localhost:40772/api/config/channels/scan"

