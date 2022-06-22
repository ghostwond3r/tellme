#!/bin/bash
# TellMe
# by wondR

lolcat <<"EOF"

╔╦╗┌─┐┬  ┬     
 ║ ├┤ │  │     
 ╩ └─┘┴─┘┴─┘   
╔╦╗┌─┐         
║║║├┤          
╩ ╩└─┘         
┬ ┬┬ ┬┌─┐      
│││├─┤│ │      
└┴┘┴ ┴└─┘      
╦┌┬┐           
║│││           
╩┴ ┴           
┌─┐┌─┐┌┐┌┌┐┌┌─┐
│ ┬│ │││││││├─┤
└─┘└─┘┘└┘┘└┘┴ ┴
┬ ┬┌─┐┌─┐┬┌─   
├─┤├─┤│  ├┴┐   
┴ ┴┴ ┴└─┘┴ ┴   

EOF

ROOT_DIR=/root

# check if we are ROOT
if [ $EUID -ne 0 ]; then
  echo "This script must be run as root."
  exit 1
fi

# enable command aliasing
shopt -s expand_aliases

# skip prompts in apt-upgrade...
export DEBIAN_FRONTEND=noninteractive
alias apt-get='yes "" | apt-get -o Dpkg::Options::="--force-confdef" -y'
apt-get update

apt-get install sublist3r -y
git clone https://github.com/n4Zz2/getIPs.git
cd getIPs
pip install getips
cd ..
chmod +x tellme.sh

echo "Done !"
