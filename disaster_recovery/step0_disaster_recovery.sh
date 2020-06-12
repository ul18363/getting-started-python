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
sudo snap connect chromium:removable-media # Allow chromium access to external drives
# Install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text
# Install Anaconda
cd /tmp
sudo apt install curl # Dependency to install it
# curl -O https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh # Old version (Python 3.6)

curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh # Newer version (Python 3.7)
# Use the sha256sum command to verify the script checksum:
# sha256sum Anaconda3-5.2.0-Linux-x86_64.sh
# Make sure the hash printed from the command above matches the one available at the Anaconda with Python 3 on 64-bit Linux page for your appropriate Anaconda version.
# https://docs.anaconda.com/anaconda/install/hashes/Anaconda3-5.2.0-Linux-x86_64.sh-hash.html
# bash Anaconda3-5.2.0-Linux-x86_64.sh
bash Anaconda3-2020.02-Linux-x86_64.sh
# Press ENTER to continue
# Install Add in for spyder to run jupyter notebooks in spyder
conda install spyder-notebook -c spyder-ide
# Install VLC
sudo apt-get install vlc
# Install DataGrip
sudo snap install datagrip --classic
# Install spyder3 nothing against 4 however 3 is way faster to show the variables
sudo apt-get install spyder3