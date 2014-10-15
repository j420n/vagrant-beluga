#!/bin/bash
set -e

if [ -f /vagrant/vagrant.pp ] ;
then
  echo 'Found local vagrant.pp'
fi

#Update Apt
sudo apt-get update

#Temporary - need to add these to the base box? Comment these out after the first run.
sudo gem install hiera
sudo gem install hiera-eyaml

#Currently librarian-puppet is not working out of the box for ruby 1.9.1
#see below for required modules
#sudo gem install librarian-puppet
#Update puppet module dependencies using librarian-puppet
#librarian-puppet update

#Do it yourself!
cd /vagrant/puppet-modules
git clone git@github.com:SilexConsulting/puppetlabs-apache.git apache
git clone git@github.com:SilexConsulting/puppetlabs-apt
git clone git@github.com:SilexConsulting/puppet-beluga.git beluga
git clone git@github.com:SilexConsulting/puppetlabs-composer.git
git clone git@github.com:SilexConsulting/puppetlabs-concat.git
git clone git@github.com:SilexConsulting/puppet-jenkins.git jenkins
git clone git@github.com:SilexConsulting/puppetlabs-mysql.git
git clone git@github.com:SilexConsulting/puppetlabs-mysql.git
git clone git@github.com:SilexConsulting/puppet-postfix
git clone git@github.com:SilexConsulting/puppetlabs-stdlib.git
git clone git@github.com:SilexConsulting/puppet-wget.git

if [ ! -f /vagrant/keys/private_key.pkcs7.pem ];
then
    mkdir /vagrant/keys
    cd /vagrant/keys
    eyaml  createkeys
fi

#sudo apt-get update

sudo rm -rf /etc/puppet/modules
ln -sf /vagrant/puppet-modules /etc/puppet/modules
ln -sf /vagrant/hiera.yaml /etc/puppet/
ln -sf /vagrant/puppet-modules/beluga/files/hieradata /etc/