class tuned (
  Boolean $enabled                                               = $tuned::params::enabled,
  String $profile                                                = $tuned::params::profile,
  Boolean $dynamic_tuning                                        = $tuned::params::dynamic_tuning,
  Integer $sleep_interval                                        = $tuned::params::sleep_interval,
  Integer $update_interval                                       = $tuned::params::update_interval,
  String $majversion                                             = $tuned::params::majversion,
  Variant[Stdlib::Compat::Absolute_path, String[0,0]] $main_conf = $tuned::params::main_conf,
  Stdlib::Compat::Absolute_path $profiles_path                   = $tuned::params::profiles_path,
  String $active_profile_conf                                    = $tuned::params::active_profile_conf,
  Array $packages                                                = $tuned::params::packages,
  Array $services                                                = $tuned::params::services,
  String $package_ensure                                         = $tuned::params::package_ensure,
  String $service_ensure                                         = $tuned::params::service_ensure,
) inherits tuned::params {

  include tuned::install
  include tuned::service

  if $enabled {
    include tuned::config

    Class['tuned::install'] -> Class['tuned::config'] -> Class['tuned::service']
    Class['tuned::install'] ~> Class['tuned::service']
  }
  else {
    Class['tuned::service'] -> Class['tuned::install']
  }
}
