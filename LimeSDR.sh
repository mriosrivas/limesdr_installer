#!/bin/sh
# update & upgrade #

#1. install all drivers for LimeSDR
sudo add-apt-repository -y ppa:myriadrf/drivers
sudo apt-get update
sudo apt-get install limesuite liblimesuite-dev limesuite-udev limesuite-images
sudo apt-get install soapysdr soapysdr-module-lms7


#core framework and toolkits (required)
sudo add-apt-repository -y ppa:pothosware/framework

#support libraries for pothos (required)
sudo add-apt-repository -y ppa:pothosware/support

#supplies soapysdr, and drivers (required)
sudo add-apt-repository -y ppa:myriadrf/drivers

#always update after adding PPAs
sudo apt-get update


#2. install Pothos and toolkits
sudo apt-get install pothos-all

#install bindings for python2
sudo apt-get install python-pothos

#or install bindings for python3
#sudo apt-get install python3-pothos

#install development files for python blocks
sudo apt-get install pothos-python-dev


#3. SDR runtime Packages 
#soapy sdr runtime and utilities
sudo apt-get install soapysdr

#python language bindings
sudo apt-get install python-soapysdr python-numpy


#4. testing installation
#print information about the install
PothosUtil --system-info
SoapySDRUtil --info

#add user to use USB
USER="$(whoami)"
sudo usermod -a -G root $USER

wget https://raw.githubusercontent.com/pothosware/PothosDemos/master/simple_fm_demod/simple_fm_demod.pothos

#run the design GUI -- there should also be a menu shortcut
#PothosGui
