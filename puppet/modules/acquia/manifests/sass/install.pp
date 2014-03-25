class acquia::sass::install {
  Package {
    require => [
      Class['acquia::sass::preinstall']
    ],
  }

  # package { 'rubygems' :
  #   name    => 'rubygems',
  #   ensure  => 'installed',
  #   require => [Class['acquia::sass::apt']]
  # }

  # package { ['sass']:
  #   provider  => 'gem',
  #   ensure    => 'present',
  # }
  exec { "sass-apt-update":
    command => "/usr/bin/apt-get update"
  }
  class { 'rbenv': install_dir => '/opt/rbenv' }
  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.0.0-p247': global => true }
  rbenv::gem { 'sass': ruby_version => '2.0.0-p247' }
}
