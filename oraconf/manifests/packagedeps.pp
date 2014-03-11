
class oraconf::packagedeps {

$pkgdeps = [ "binutils.x86_64",
             "glibc.x86_64",
             "glibc.i686",
             "compat-libstdc++-33.x86_64",
             "compat-libstdc++-33.i686",
             "glibc-common.x86_64",
             "glibc-devel.x86_64",
             "glibc-devel.i686",
             "glibc-headers.x86_64",
             "elfutils-libelf.x86_64",
             "elfutils-libelf-devel.x86_64",
             "gcc.x86_64",
             "gcc-c++.x86_64",
             "ksh.x86_64",
             "libaio.x86_64",
             "libaio.i686",
             "libaio-devel.x86_64",
             "libaio-devel.i686",
             "libgcc.x86_64",
             "libgcc.i686",
             "libstdc++.x86_64",
             "libstdc++.i686",
             "libstdc++-devel.x86_64",
             "make.x86_64",
             "numactl-devel.x86_64",
             "sysstat.x86_64",
             "compat-libcap1.x86_64",
             "compat-libcap1.i686",
           ]

  package { $pkgdeps: ensure => "installed" }

}
