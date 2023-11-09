# Install a package or take any other action necessary to fix the issue
package { 'apache2':
  ensure => 'installed',
}

# Check if the wp-settings.php file exists before editing it
exec { 'check_wp_settings':
  command => '/bin/test -f /var/www/html/wp-settings.php',
  onlyif  => '/bin/test -f /var/www/html/wp-settings.php',
}

# Create the missing configuration file if wp-settings.php exists
exec { 'fix_phpp':
  command     => 'sed -i s/phpp/php/g /var/www/html/wp-settings.php',
  path        => '/usr/bin',
  refreshonly => true,
  subscribe   => Exec['check_wp_settings'],
  require     => Package['apache2'],
}

# Ensure the Apache service is running and enabled
service { 'apache2':
  ensure  => 'running',
  enable  => true,
  require => Exec['fix_phpp'],
}
