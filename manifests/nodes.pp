node default {
  crit( "Node only matched \"default\" for which there is no configuration, $::hostname" )
}

node 'debian.vagrant' {

  class { 'beluga::developer_tools':
    install_grunt             => false,
    install_git               => true,
    install_vim               => true,
  }

  #class { 'jenkins':
  #  configure_firewall        => false,
  #}

}