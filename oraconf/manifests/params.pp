
class oraconf::params (

    # General and Environment
    $oracleVers    = '11.2.0',
    $oracleBase    = '/u01',
    $oracleHome    = '/u01/product/11.2.0/db',
    $oracleUsrPwd  = 'oracle',

    # sysctl.conf
    $fsSuidDumpable          = 1,
    $fsAioMaxNr              = 1048576,              # Async IO Requests
    $fsFileMax               = 6815744,              # File Handles (Max Processes(default 150) * 512)
    #$kernelShmAll            = 2097152,
    $kernelShmAll            = 524288,               # echo "MEM * 1024^3 / 4096" | bc
    #$kernelShmMax            = 536870912,
    $kernelShmMax            = 1073741824,           # echo "MEM * 1024^3 / 2" | bc
    $kernelShmMni            = 4096,                 # getconf PAGE_SIZE
    $kernelSem               = '250 32000 100 128',  # semmsl semmns semopm semmni (semmns = semmsl * semmni)
    $netIpv4IpLocalPortRange = '9000 65500',
    $netCoreRmemDefault      = 262144,
    $netCoreRmemMax          = 4194304,
    $netCoreWmemDefault      = 262144,
    $netCoreWmemMax          = 1048586,

    # limits.conf
    $oracleSoftNproc  = 2047,
    $oracleHardNproc  = 16384,
    $oracleSoftNofile = 4096,
    $oracleHardNofile = 65536,
    $oracleSoftStack  = 10240,

    $selinuxmode      = permissive

  ) {
  # null
}
