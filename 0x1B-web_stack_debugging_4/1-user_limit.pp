# Enable the user holberton to login and open files without error.

# Increase hard file limit for Holberton user.
exec { 'increase-hard-file-limit-for-holberton-user':
  command => '/bin/bash -c "echo \'holberton hard nofile 50000\' >> /etc/security/limits.conf"',
  path    => '/usr/local/bin:/bin',
  unless  => '/bin/grep -q "^holberton hard" /etc/security/limits.conf',
}

# Increase soft file limit for Holberton user.
exec { 'increase-soft-file-limit-for-holberton-user':
  command => '/bin/bash -c "echo \'holberton soft nofile 50000\' >> /etc/security/limits.conf"',
  path    => '/usr/local/bin:/bin',
  unless  => '/bin/grep -q "^holberton soft" /etc/security/limits.conf',
}

# Reload limits after modification.
exec { 'reload-limits':
  command     => 'pkill -HUP -u holberton',
  path        => '/usr/local/bin:/bin',
  refreshonly => true,
}
