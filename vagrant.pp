#INCLUDE CLASSES DECLARED IN HIERADATA
#Look at beluga/files/hieradata/common.yaml
hiera_include("classes")
stage { 'pre':
  before => Stage["main"],
}
notify{'Using vagrant.pp':}
#jenkins::plugin { 'git':
#  source => 'https://updates.jenkins-ci.org/download/plugins/git/2.3.5/git.hpi',
#}
#jenkins::plugin { 'git-client':
#  source => 'https://updates.jenkins-ci.org/download/plugins/git-client/1.17.1/git-client.hpi',
#}
#jenkins::plugin { 'publish-over-ssh':
#  source => 'https://updates.jenkins-ci.org/download/plugins/publish-over-ssh/1.12/publish-over-ssh.hpi'
#}
#jenkins::plugin { 'job-import-plugin':
#  source => 'https://updates.jenkins-ci.org/download/plugins/job-import-plugin/1.2/job-import-plugin.hpi'
#}

#DECLARE DRUPAL SITE NAMES
beluga::drupal_site {'silex' : }

#DECLARE CUSTOM SITE NAMES
#beluga::custom_site {'silex' : }

#DEFAULT DRUPAL SITE OWNER
#TO OVERRIDE THIS SET "::beluga::drupal_site::<NAME-OF-SITE>::site_owner: <YOUR-NAME>" IN COMMON.YAML
beluga::user {'beluga':
   uid => 5002,
   ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ',
   key_type => 'ssh-rsa'
}
#IF YOU WANT TO CHANGE THIS CREATE A NEW USER BELOW
#beluga::user {'<NEW-USER-NAME>':
#  uid => 5005,
#  ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ',
#  key_type => 'ssh-rsa'
#}
