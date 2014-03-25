class acquia::drush (
  $owner ='vagrant',
  $group = 'vagrant',
  $shared_folder='/vagrant'
) {

  # resources
  if $owner == 'root' {
    $uhome = "/${owner}"
  }
  else {
    $uhome = "/home/${owner}"
  }

  # Install composer globally
  exec { 'composer':
    command   => 'curl -sS -O https://getcomposer.org/installer',
    require   => Package['curl', 'php5-cli'],
    path      => ['/usr/bin', '/usr/sbin']
  }

  exec { 'composer-php':
    command   => 'php installer',
    path      => ['/usr/bin'],
    require   => Exec['composer']
  }

  exec { 'composer-global':
    command   => "mv ${uhome}/composer.phar /usr/bin/composer",
    require   => Exec['composer-php'],
    path      => ['/bin']
  }

  file { "${uhome}/.composer":
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    require => Exec['composer-global']
  }

  file { "${uhome}/.composer/vendor":
    ensure  => directory,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    require => File["${uhome}/.composer"]
  }

  file { "${uhome}/.composer/composer.json":
    ensure  => present,
    owner   => $owner,
    group   => $group,
    mode    => '0644',
    content => template('acquia/composer.json.erb'),
    require => Exec['composer-php']
  }

  # exec { 'install-drush':
  #   command   => '/usr/bin/composer global require drush/drush:dev-master --prefer-source',
  #   require   => [ Exec['composer-global'], File["${uhome}/.bashrc"] ],
  #   path      => ['/usr/bin'],
  #   logoutput => 'on_failure'
  # }
}
