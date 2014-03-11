
class oraconf::addgroups {

  group { "oinstall":
    gid    => 501, 
    ensure => "present",
  }

  group { "dba":
    gid    => 502, 
    ensure => "present",
  }

  group { "oper":
    gid    => 503, 
    ensure => "present",
  }

  group {"asmadmin":
    gid    => 504,
    ensure => "present",
  }

  group {"asmdba":
    gid    => 506,
    ensure => "present",
  }

  group {"asmoper":
    gid    => 505,
    ensure => "present",
  }

}
