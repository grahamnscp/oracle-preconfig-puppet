
class oraconf::hugepages inherits oraconf::params {

  # sed -i '/^\skernel \/vmlinuz/ s/$/ transparent_hugepage=never/g' /boot/grub/grub.conf
  exec { "disable-hugepages-grub":
    command => "/bin/sed -i '/^\\skernel\s/ s/$/ transparent_hugepage=never/g' /boot/grub/grub.conf",
    unless  => "/bin/grep -q 'transparent_hugepage' /boot/grub/grub.conf",
  }
  # /sys/kernel/mm/transparent_hugepage/enabled
  # always madvise [never]

}
