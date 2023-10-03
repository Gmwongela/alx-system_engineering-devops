# Include the stdlib module to enable the file_line resource
include stdlib

# Define a class for SSH client configuration
class ssh_client_config {
  file_line { 'Turn off passwd auth':
    path   => '/etc/ssh/ssh_config',
    line   => 'PasswordAuthentication no',
    match  => '^PasswordAuthentication',
    ensure => present,
  }

  file_line { 'Declare identity file':
    path   => '/etc/ssh/ssh_config',
    line   => 'IdentityFile ~/.ssh/school',
    match  => '^#?IdentityFile',
    ensure => present,
  }
}

# Apply the SSH client configuration class
include ssh_client_config
