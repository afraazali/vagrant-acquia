node default {
  include apt
  include curl

  package { ['git-core', 'nfs-common', 'unzip', 'sendmail']: }

  class { "acquia":
  	db_name    => 'gdpc',
  	db_user	   => 'gdpc',
  	db_pass    => 'gdpc'
  }
}
