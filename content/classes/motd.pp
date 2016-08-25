class motd {
  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    content => 'Hello world! Puppet is awesome.',
  }
}

include motd