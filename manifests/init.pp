class aide(
            $manage_package = true,
            $package_ensure = 'installed',
          ) inherits aide::params{

  validate_re($package_ensure, [ '^present$', '^installed$', '^absent$', '^purged$', '^held$', '^latest$' ], 'Not a supported package_ensure: present/absent/purged/held/latest')

  class { '::aide::install': }
  -> class { '::aide::config': }
  -> Class['::aide']

}
