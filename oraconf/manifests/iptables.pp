
class oraconf::iptables inherits oraconf::params {


  service { "iptables":
    ensure  => "running",
    enable  => "true",
  }

  file { "iptables_conf":
    ensure      => present,
    path        => '/etc/iptables.conf',
    source      => 'puppet:///modules/oraconf/iptables.conf',
    owner       => root,
    group       => root,
    mode        => 0600,
    notify      => Exec["iptables_load"],
  }

  exec { "iptables_load":
    command     => "/sbin/iptables-restore < /etc/iptables.conf",
    refreshonly => true,
    require     => File["iptables_conf"],
    notify      => Service["iptables"],
  }

}
