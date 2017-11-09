class tuned::install (
  Boolean $enabled = $tuned::enabled,
  Array[String] $packages = $tuned::packages,
  String $package_ensure = $tuned::package_ensure,
) inherits tuned {

  package { 'tuned':
    ensure => $package_ensure,
  }

  $_ensure = $enabled ? {
    true  => 'present',
    false => 'absent',
  }

  if length($packages) > 0 {
    package { $packages:
      ensure => $_ensure,
    }
  }
}
