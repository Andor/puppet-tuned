class tuned::service (
  Boolean $enabled = $tuned::enabled,
  Array[String] $services = $tuned::services,
  String $service_ensure = $tuned::service_ensure,
) inherits tuned {

  $service_enable = $service_ensure ? {
    'absent'  => false,
    'stopped' => false,
    default   => true,
  }
  service { 'tuned':
    ensure => $service_ensure,
    enable => $service_enable,
  }

  $_ensure = $enabled ? {
    true  => running,
    false => stopped,
  }

  if length($services) > 0 {
    service { $services:
      ensure => $_ensure,
      enable => $enabled,
    }
  }
}
