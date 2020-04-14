#Install Python
sudo apt install python
#Install GitKraken
## Get Dependencies
sudo apt-get install gconf2
sudo apt-get install gconf-service
## Get Files and install
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
### Note: If something fails you can use 'sudo apt --fix-broken install' to get the dependencies
# Install Chromium
sudo apt-get install chromium-browser
# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
