#!/bin/bash
set -e

if [ -f /vagrant/vagrant.pp ] ;
then
  echo 'Found local vagrant.pp'
fi

#Install Puppet Labs repositories. DEBIAN
#wget "https://apt.puppetlabs.com/puppetlabs-release-pc1-wheezy.deb"
#wget "https://apt.puppetlabs.com/puppetlabs-release-jessie.deb"
#wget "https://apt.puppetlabs.com/puppetlabs-release-wheezy.deb"
#sudo dpkg -i puppetlabs-release-pc1-wheezy.deb
#sudo dpkg -i puppetlabs-release-jessie.deb
#sudo dpkg -i puppetlabs-release-wheezy.deb
#sudo apt-get update

#Install Puppet Labs repositories. UBUNTU
#wget "https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb"
#sudo dpkg -i puppetlabs-release-pc1-trusty.deb
#sudo apt-get update

#Test for Puppet Master
command -v puppet master >/dev/null 2>&1 || {
                                      echo >&2 "Puppetmaster is required, but it is not installed.  Installing...";
                                      sudo apt-get -y install puppetmaster;
                                     }

ln -sf /vagrant/puppet.conf /etc/puppet/
ln -sf /vagrant/puppetdb.conf /etc/puppet/
ln -sf /vagrant/routes.yaml /etc/puppet/

#Test for PuppetDB
if [ ! -d /etc/puppetdb ];
then
    echo >&2 "PuppetDB is required, but it is not installed.  Installing...";
    sudo apt-get -y install puppetdb;
    sudo apt-get -y install puppetdb-terminus;
    echo >&2 "PuppetDB is Installed.";
fi

if [ -d /etc/puppet ];
then
    echo >&2 "The Puppet master has been found. Welcome to the Puppet show.";
    sudo service puppetmaster restart;
    sudo service puppetdb restart;
    echo "The Puppet Master is ready to perform.";
fi



#Test for Puppet Librarian
command -v librarian-puppet >/dev/null 2>&1 || {
                                      echo >&2 "Librarian-puppet is required, which needs git-core. They are not installed yet...";
                                      sudo apt-get -y install librarian-puppet;
                                      echo >&2 "Librarian-puppet Installed";
                                      sudo apt-get install git-core -y;
                                      echo >&2 "Git Installed";
                                     }

#Temporary - need to add these to the base box?
#sudo gem install hiera
#sudo gem install hiera-eyaml

#OPTION 2 - UBUNTU
#Update Puppetfile dependencies using librarian-puppet from apt-get.
#sudo apt-get install git-core -y
#sudo apt-get install librarian-puppet -y

#OPTION 3 - UBUNTU
#Update puppet module dependencies using gem install librarian-puppet.
#sudo apt-get install ruby1.9.1-dev -y
#sudo apt-get install git-core -y
#sudo gem install librarian-puppet --verbose

#cd /vagrant/modules
#librarian-puppet update --verbose

if [ ! -f /vagrant/keys/private_key.pkcs7.pem ];
then
    cd /vagrant
    eyaml createkeys
fi

ln -sf /vagrant/hiera.yaml /etc/puppet/
ln -sf /vagrant/hieradata /etc/
