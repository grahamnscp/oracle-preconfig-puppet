
class oraconf::selinux ( $mode = $oraconf::params::selinuxmode ) inherits oraconf::params {

  # Set selinux mode
  # sed -i "s@^\(SELINUX=\).*@\1permissive@" /etc/sysconfig/selinux
  if $mode == 'enforcing' or $mode == 'permissive' or $mode == 'disabled' {
    $set_command = "/bin/sed -i 's@^\\(SELINUX=\\).*@\\1${mode}@' /etc/sysconfig/selinux"
  }

  exec { "set-selinux-${mode}":
    command => $set_command,
    unless  => "/bin/grep -q 'SELINUX=${mode}' /etc/sysconfig/selinux",
  }

  case $mode {
    permissive,disabled: {
      exec { "setenforce-0":
        command => "/usr/sbin/setenforce 0",
        unless  => "/usr/sbin/getenforce | grep -q -e 'Permissive' -e 'Disabled'"
      }
    }
    enforcing: {
      exec { "setenforce-1":
        command => "/usr/sbin/setenforce 1",
        unless  => "/usr/sbin/getenforce | grep -q -e 'Enforcing'"
      }
    }
  }

  # Install selinux util and ploicy packages
  $selinuxpkgs = [ "selinux-policy.noarch",
                   "checkpolicy.x86_64",
                   "libsemanage.x86_64",
                   "libsepol.x86_64",
                   "policycoreutils.x86_64"
                 ]

  package { $selinuxpkgs: ensure => ["installed","latest"] }
 

}
