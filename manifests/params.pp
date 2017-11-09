class tuned::params {
  $enabled = true
  $packages = []
  $sleep_interval = 1
  $update_interval = 10
  $package_ensure = 'present'
  $service_ensure = 'running'

  if $::tuned_version and $::tuned_version =~ /^(\d+)\.[\d\.]+$/ {
    $_majversion = $1
  }
  else {
    $_majversion = undef
  }

  case $::operatingsystem {
    'Fedora': {
      $majversion = pick($_majversion, '2')
      $dynamic_tuning = true
      $main_conf = '/etc/tuned/tuned-main.conf'
      $services = []
      $profile = '' #autodetect
      $profiles_path = '/etc/tuned'
      $active_profile_conf = 'active_profile'
    }

    'RedHat','CentOS','Scientific','OracleLinux': {
      case $::operatingsystemmajrelease {
        '6': {
          $majversion = pick($_majversion, '0')
          $dynamic_tuning = false
          $main_conf = '' # unsupported
          $services = ['ktune']
          $profile = 'default'
          $profiles_path = '/etc/tune-profiles'
          $active_profile_conf = 'active-profile'
        }

        '7': {
          $majversion = pick($_majversion, '2')
          $dynamic_tuning = false
          $main_conf = '/etc/tuned/tuned-main.conf'
          $services = []
          $profile = '' #autodetect
          $profiles_path = '/etc/tuned'
          $active_profile_conf = 'active_profile'
        }

        default: {
          fail("Unsupported OS release: \
${::operatingsystem} ${::operatingsystemmajrelease}")
        }
      }
    }

    default: {
      fail("Unsupported OS: ${::operatingsystem}")
    }
  }
}
