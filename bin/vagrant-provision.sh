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
sudo apt-get install ruby1.9.1-dev

#Update puppet module dependencies using librarian-puppet
sudo gem install librarian-puppet
cd /vagrant/modules
librarian-puppet update

if [ ! -f /vagrant/keys/private_key.pkcs7.pem ];
then
    cd /vagrant
    eyaml  createkeys
fi

sudo rm -rf /etc/puppet/modules
ln -sf /vagrant/modules /etc/puppet/modules
ln -sf /vagrant/hiera.yaml /etc/puppet/
ln -sf /vagrant/modules/beluga/files/hieradata /etc/