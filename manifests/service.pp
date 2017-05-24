class aide::service inherits aide {

  #
  validate_bool($aide::manage_docker_service)
  validate_bool($aide::manage_service)
  validate_bool($aide::service_enable)

  validate_re($aide::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${aide::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $aide::manage_docker_service)
  {
    if($aide::manage_service)
    {
      service { $aide::params::service_name:
        ensure => $aide::service_ensure,
        enable => $aide::service_enable,
      }
    }
  }
}
