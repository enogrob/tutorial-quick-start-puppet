Classes
-------

Classes define a collection of resources that are managed together as a single unit. You can also think of them as named blocks of Puppet code, which are created in one place and invoked elsewhere.

At the end of this course you will be able to:

* Describe Puppet resources and classes.
* Create a class using proper syntax.
* Differentiate between defining and declaring classes.

## Quiz

1. A class is made up of Puppet resources.
[x] True
[ ] False

2. Defining a class automatically includes the class in your configuration.
[ ] True
[x] False

3. In the following example, how many resources are being defined?
```
class ssh { 
  package { 'openssh-clients': 
      ensure => present, 
  }
  file { '/etc/ssh/ssh_config': 
     ensure => file,
     owner => 'root',
     group => 'root',
     source => 'puppet:///modules/ssh/ssh_config',
  } 
   service { 'sshd': 
     ensure => running, 
      enable => true,
  }
}
```
[ ] 1
[ ] 2
[x] 3
[ ] 4

4. In the following example, what is the title of the class? 
```
class ssh {
  package { 'openssh-clients':
     ensure => present,
  }
  file { '/etc/ssh/ssh_config':
     ensure => file,
     owner => 'root',
     group => 'root',
     source => 'puppet:///modules/ssh/ssh_config',
  }
  service { 'sshd':
     ensure => running,
     enable => true,
  }
}
```
[x] ssh
[ ] openssh-clients
[ ] sshd
[ ] ssh_config

5. Puppet classes are reusable and singleton.
[x] True
[ ] False

## Exercises

1. Create a new manifest file called motd.pp:

```
vim motd.pp
```

2. In that file create a class named motd that will manage the /etc/motd file in a given state.

3. The file resource that your class contains might look similar to:

```puppet
file { '/etc/motd':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  content => 'Hello world! Puppet is awesome.',
}
```

4. Run `puppet parser validate motd.pp` to validate your syntax.

```
puppet parser validate motd.pp
```

5. Apply your manifest with `puppet apply motd.pp`. Notice that no changes were made. Why is that?

```bash
sudo puppet apply motd.pp
cat /etc/motd
ls -la /etc/motd
```

6. Add the line include motd to the end of your manifest and apply it again. Can you explain why you saw the results you did?