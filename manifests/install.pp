# Class arc_ce::install
# Installs the ARC6 package
class arc_ce::install(


  package { ['emi-resource-information-service', 'emi-bdii-top', 'glite-yaim-core', 'glite-yaim-bdii']:
    ensure          => installed,
    install_options => {'--disablerepo' => 'epel'},
  }

  package { 'nordugrid-arc-arex':
    ensure => $ensure,
    name   => $arex_package,
  }

  # define virtual resources for non-essential packages
  # they are realized when the related block in arc.conf is enabled

  if  $gridftpd_ensure !~ Undef {
    @package { 'arc-package-gridftpd':
      ensure => $gridftpd_ensure,
      name   => $gridftpd_package,
    }
  }

  if $infosysldap_ensure !~ Undef {
    @package { 'arc-package-infosys-ldap':
      ensure => $infosysldap_ensure,
      name   => $infosysldap_package,
    }
  }

  include arc_ce::lcmaps::install
  include arc_ce::lcas::install

}
