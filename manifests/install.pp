class aide::install inherits aide {

  if($aide::manage_package)
  {
    package { $aide::params::package_name:
      ensure => $aide::package_ensure,
    }
  }

}
