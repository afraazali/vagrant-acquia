#!/bin/bash

ROOT=$1
PROFILE=$2

# Install Drush
if [ ! -f /home/vagrant/.composer/vendor/drush/drush ]; then
  su -c "/usr/bin/composer global require drush/drush:dev-master --prefer-source" vagrant;
fi

# Repackage the profile just in case there are changes
cd /vagrant/apps/drupal/profiles;
if [ -e "$PROFILE.tar.gz" ]; then
  rm  $PROFILE.tar.gz
fi

tar -cvzf $PROFILE.tar.gz $PROFILE;

# If the app is not yet there, please deploy
if [ ! -f $ROOT/index.php ]; then
  /home/vagrant/.composer/vendor/bin/drush make $PROFILE/${PROFILE}_stub.make $ROOT -y;

  chown vagrant:www-data -Rf $ROOT;
  chmod g+w -Rf $ROOT;

  cd $ROOT;
  sudo -u vagrant /home/vagrant/.composer/vendor/bin/drush si $PROFILE --db-url=mysql://gdpc:gdpc@localhost/gdpc --account-mail=$PROFILE@example.com --account-name=$PROFILE --account-pass=$PROFILE --site-name=$PROFILE --site-mail=$PROFILE@example.com -y;
fi

# ensure solr is running
sudo /etc/init.d/solr restart

#ensure varnish is running
sudo /etc/init.d/varnish restart
