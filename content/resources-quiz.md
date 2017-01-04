# Resources

Understanding Resources is fundamental to understanding how Puppet works. Resources are like building blocks (think Lego). They can be combined to model the expected state of the systems you manage.

At the end of this course you will be able to:

* Explain what a Puppet resource is.
* Create a Puppet resource using proper syntax.
* Examine resources using the `puppet resource` tool.

## Quiz

1. Resources give the user the ability to model a system's configuration.
[x] True
[ ] False

2. Every resource has a type, title, and a set of:
[ ] functions
[ ] classes
[x] attributes
[ ] values

3. Using the following resource declaration, what is the title of the resource?
```
file { '/etc/passwd':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600',
}`
```
[ ] file
[x] /etc/passwd
[ ] owner
[ ]group

4. Puppet uses the Resource Abstraction Layer (RAL) to abstract types (high-level models) from the low level implementation, or:
[ ] classes
[ ] functions
[x] providers
[ ] operating systems

5. Puppet allows you to declare the same resource twice.
[ ] True
[x] False

## Exercises

1. Execute the puppet resource command to query the users on your system.
```
resources (master)]$ puppet resource user enogrob
user { 'enogrob':
  ensure   => 'present',
  comment  => 'Roberto Nogueira',
  gid      => '20',
  groups   => ['_appserveradm', '_appserverusr', '_lpadmin', 'admin', 'com.apple.sharepoint.group.2', 'staff'],
  home     => '/Users/enogrob',
  password => '*',
  shell    => '/bin/bash',
  uid      => '502',
}
user { 'nobody':
  ensure   => 'present',
  comment  => 'Unprivileged User',
  gid      => '-2',
  home     => '/var/empty',
  password => '*',
  shell    => '/usr/bin/false',
  uid      => '-2',
}
user { 'root':
  ensure   => 'present',
  comment  => 'System Administrator',
  gid      => '0',
  groups   => ['admin', 'certusers', 'daemon', 'kmem', 'operator', 'procmod', 'procview', 'staff', 'sys', 'tty', 'wheel'],
  home     => '/var/root',
  password => '*',
  shell    => '/bin/sh',
  uid      => '0',
}
[...]
```

2. Execute the puppet resource user root command to query the system about the state of the root user.

```
resources (master)]$ puppet resource user enogrob
user { 'enogrob':
  ensure   => 'present',
  comment  => 'Roberto Nogueira',
  gid      => '20',
  groups   => ['_appserveradm', '_appserverusr', '_lpadmin', 'admin', 'com.apple.sharepoint.group.2', 'staff'],
  home     => '/Users/enogrob',
  password => '*',
  shell    => '/bin/bash',
  uid      => '502',
}
```

3. Execute puppet resource commands to query the system for the state of packages and host records.

```
[resources (master)]$ puppet resource package
package { 'CFPropertyList':
  ensure => ['2.2.8'],
}
package { 'Flask':
  ensure => '0.11.1',
}
:

[root@training ~]# puppet resource host
host { '3dns-1.adobe.com':
  ensure => 'present',
  ip     => '127.0.0.1',
  target => '/etc/hosts',
}
host { '3dns-2.adobe.com':
  ensure => 'present',
  ip     => '127.0.0.1',
  target => '/etc/hosts',
}
:
```