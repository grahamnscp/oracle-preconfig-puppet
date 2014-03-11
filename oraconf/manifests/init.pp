
# Puppet standalone command:   puppet apply --verbose  -e 'include oraconf'

class oraconf {

  include oraconf::addgroups
  include oraconf::adduser
  include oraconf::sysctl
  include oraconf::limits

  include oraconf::packagedeps

  include oraconf::selinux

  include oraconf::iptables
}
