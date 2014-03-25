class acquia::sass::apt {
  exec { 'acquia::sass::apt-get update':
    command     => 'apt-get update',
    path        => '/usr/bin',
    refreshonly => true,
  }
}
