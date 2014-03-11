
# Puppet standalone command:   puppet apply --verbose  -e 'include oraconf'

class oraconf ( $oraconf::params::oracleVers    = '11.2',
                $oraconf::params::oracleBase    = '/u01',
                $oraconf::params::oracleHome    = '$oracle_base/product/$oracle_vers/db',
                $oraconf::params::oracleUsrPwd  = 'oracle') {

  include oraconf::addgroups
  include oraconf::adduser
  include oraconf::sysctl
  include oraconf::limits

  include oraconf::packagedeps

}
