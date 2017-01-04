Autoloading
-----------

Autoloading in Puppet means that your modules will be loaded by Puppet at compile time, as long as they follow a predictable structure. This course will help you with the basics of Autoloading.

At the end of this course you will be able to:

* Identify your current `modulepath`.
* Organize your modules in Puppet's expected and predictable structure.

## Quiz

1. Classes define a collection of resources that are managed together as a single unit.
[x] True
[ ] False

2. Which configuration setting specifies the location that Puppet will search for your modules?
[ ] module_working_dir
[x] modulepath
[ ] module_repository
[ ] manifestdir

3. A module is simply a directory tree with a specific, predictable structure. Which directory should hold your manifests?
[ ] /files
[ ] /templates 
[x] /manifests
[ ] /spec

4. When are modules autoloaded?
[ ] Just before a Puppet run.
[ ] Just after a Puppet run.
[x] At the time of a Puppet run.
[ ] When they are saved to disk.

5. Puppet's pre-defined structure allows for all of the following benefits, except:
[ ] auto-loading of classes
[ ] file serving
[ ] auto delivery of extensions
[x] auto-declared classes

## Exercises

1. Login shells are the programs that users interact with. They interpret commands typed at the command line. We would like to ensure that our system allows users to use the shells we have installed, by listing them in `/etc/shells`. Execute the following command. This will return the current modulepath for your Puppet installation.
```
puppet config print modulepath
```

2. Change your current working directory to your module path with:
```
cd /etc/puppetlabs/puppet/modules
```

3. Examine the directory structure of the example shells module.
```
[root@training modules]# tree shells/
shells/
├── files
│   └── shells
├── manifests
│   └── init.pp
├── Modulefile
├── README
├── spec
│   └── spec_helper.rb
└── tests
    └── init.pp
```

4. Edit the main class manifest file inside the shells module to include a class that manages a file resource for `/etc/shells`. If you haven't gone through the Resources lesson, you may use the resource example below.
```
vim shells/manifests/init.pp
puppet parser validate shells/manifests/init.pp
```

5. Then edit the test manifest to include the class:
```
vim shells/tests/init.pp
```

6. Finally, apply your test to observe any changes being made.
```
puppet apply shells/tests/init.pp
```

Example:
```
file { '/etc/shells':
  ensure => file,
  owner  => 'root',
  group  => 'root',
  source => 'puppet:///modules/shells/shells',
}
```