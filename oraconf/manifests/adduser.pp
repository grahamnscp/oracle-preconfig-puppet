
class oraconf::adduser (
                         $ouser  = oracle, 
                         $ogroup = oinstall,
                         $obase  = $oraconf::params::oracleBase,
                         $ohome  = $oraconf::params::oracleHome,
                         $opwd   = $oraconf::params::oraclePwd

                       ) inherits oraconf::params {

  user { "oracle_user":
    name     => "oracle",
    uid      => 502,
    gid      => oinstall,
    groups   => [dba, asmdba, oper, asmoper ],
    home     => "$obase",
    shell    => "/bin/bash",
    password => "$opwd",
    comment  => "Oracle User",
    ensure   => present,
    require  => Class['oraconf::addgroups'],
    notify   => Exec['oracle_homedir'],
  }

  exec { "oracle_homedir":
    command     => "/bin/cp -r /etc/skel/.bash_* $obase; /bin/chown -R $ouser:$ogroup $obase",
    refreshonly => true,
    #require     => User[oracle_user],
  }

  file { "oracle_bashrc":
    ensure      => present,
    path        => "$obase/.bashrc",
    owner       => $oname,
    group       => $ogroup,
    mode        => 0644,
    content     => template("oraconf/oracle_bashrc.erb"),
    require     => Exec['oracle_homedir'],
  }

}
