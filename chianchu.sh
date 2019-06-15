echo "starting mirakurun..."
sudo mirakurun status
echo "installing chinachu"
git clone git://github.com/kanreisa/Chinachu.git ~/chinachu
cd ~/chinachu/
./chinachu installer
cp config.sample.json config.json
vim config.json
