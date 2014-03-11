
class oraconf::sysctl inherits oraconf::params {

  augeas { 'oracle_sysctl':
    context => '/files/etc/sysctl.conf',
    changes => [
      "set fs.suid_dumpable             '${oraconf::params::fsSuidDumpable}'",
      "set fs.aio-max-nr                '${oraconf::params::fsAioMaxNr}'",
      "set fs.file-max                  '${oraconf::params::fsFileMax}'",
      "set kernel.shmall                '${oraconf::params::kernelShmAll}'",
      "set kernel.shmmax                '${oraconf::params::kernelShmMax}'",
      "set kernel.shmmni                '${oraconf::params::kernelShmMni}'",
      "set kernel.sem                   '${oraconf::params::kernelSem}'",
      "set net.ipv4.ip_local_port_range '${oraconf::params::netIpv4IpLocalPortRange}'",
      "set net.core.rmem_default        '${oraconf::params::netCoreRmemDefault}'",
      "set net.core.rmem_max            '${oraconf::params::netCoreRmemMax}'",
      "set net.core.wmem_default        '${oraconf::params::netCoreWmemDefault}'",
      "set net.core.wmem_max            '${oraconf::params::netCoreWmemMax}'",
    ],
    notify => Exec['sysctl_load'],
  }

  exec { "sysctl_load":
    #alias       => "sysctl",
    command     => "/sbin/sysctl -p 2>&1 > /dev/null ; exit 0",
    refreshonly => true,
    #subscribe   => Augeas["oracle_sysctl"],
  }

}

