#!/bin/bash
set -e

if [ -f /vagrant/vagrant.pp ] ;
then
  echo 'Found local vagrant.pp'
fi

#Temporary - need to add these to the base box? Comment these out after the first run.
sudo gem install hiera
sudo gem install hiera-eyaml
#Update puppet module dependencies using librarian-puppet
cd /vagrant/puppet-modules
librarian-puppet update


if [ ! -f /vagrant/keys/private_key.pkcs7.pem ];
then
    cd /vagrant
    eyaml  createkeys
fi

#sudo apt-get update
sudo rm -rf /etc/puppet/modules
ln -sf /vagrant/puppet-modules /etc/puppet/modules
ln -sf /vagrant/hiera.yaml /etc/puppet/
ln -sf /vagrant/puppet-modules/beluga/files/hieradata /etc/