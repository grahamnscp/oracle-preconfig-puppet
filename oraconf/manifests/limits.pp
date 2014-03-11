
class oraconf::limits inherits oraconf::params {

  # Update /etc/security/limits.conf
  define append_if_no_such_line($file,$entry) {
    exec { "/bin/echo '${entry}' >> '${file}'":
      unless => "/bin/grep -Fx '${entry}' '${file}'",
    }
  }

  append_if_no_such_line { 'softNproc':
    file  => '/etc/security/limits.conf',
    entry => "oracle soft nproc '${oraconf::params::oracleSoftNproc}'",
  }
  append_if_no_such_line { 'hardNproc':
    file  => '/etc/security/limits.conf',
    entry => "oracle hard nproc '${oraconf::params::oracleHardNproc}'",
  }
  append_if_no_such_line { 'softNofile':
    file  => '/etc/security/limits.conf',
    entry => "oracle soft nofile '${oraconf::params::oracleSoftNofile}'",
  }
  append_if_no_such_line { 'hardNofile':
    file  => '/etc/security/limits.conf',
    entry => "oracle hard nofile '${oraconf::params::oracleHardNofile}'",
  }
  append_if_no_such_line { 'softStack':
    file  => '/etc/security/limits.conf',
    entry => "oracle soft stack '${oraconf::params::oracleSoftStack}'",
  }


  # update /etc/security/limits.d/90-nproc.conf
  define replace_line($file,$pattern,$replacement) {
    exec { "/usr/bin/perl -pi -e 's/$pattern/$replacement/' '$file'":
      onlyif => "/usr/bin/perl -ne 'BEGIN{ \$ret = 1; } \$ret = 0 if /$pattern/ && ! /$replacement/ ; END { exit \$ret; }' '$file'";
    }
  }

  #/usr/bin/perl -pi -e 's/\*\s+soft\s+nproc\s+1024/\* - nproc 16384/' /etc/security/limits.d/90-nproc.conf
  replace_line { '90nproc':
    file        => '/etc/security/limits.d/90-nproc.conf',
    pattern     => "\\*\s+soft\s+nproc\s+1024",
    replacement => "\\*          -       nproc     '${oraconf::params::oracleHardNproc}'",
  }

}
