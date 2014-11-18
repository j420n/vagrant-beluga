#!/bin/bash
set -e

if [ -f /vagrant/vagrant.pp ] ;
then
  echo 'Found local vagrant.pp'
fi


sudo apt-get update

#Temporary - need to add these to the base box?
sudo gem install hiera
sudo gem install hiera-eyaml

#OPTION 1
#Update Puppetfile dependencies using librarian-puppet from apt-get.
#sudo apt-get install git-core -y
#sudo apt-get install librarian-puppet -y

#OPTION 2
#Update puppet module dependencies using gem install librarian-puppet.
sudo apt-get install ruby1.9.1-dev -y
sudo apt-get install git-core -y
sudo gem install librarian-puppet --verbose

if [ ! -d /vagrant/modules ];
then
    cd /vagrant
    mkdir modules
fi

cd /vagrant/modules
librarian-puppet update --verbose

if [ ! -f /vagrant/keys/private_key.pkcs7.pem ];
then
    cd /vagrant
    eyaml  createkeys
fi

ln -sf /vagrant/hiera.yaml /etc/puppet/
ln -sf /vagrant/hieradata /etc/
