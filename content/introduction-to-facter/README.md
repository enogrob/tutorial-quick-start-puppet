Facter
------

Facter is Puppet’s cross-platform system profiling library. It discovers and reports per-node facts, which are available in your Puppet manifests as variables.

At the end of this course you will be able to:

* Describe the type of information stored in Facter.
* Demonstrate how to view the information stored in Facter.

## Quiz

1. The primary purpose of Facter is to store information about the Puppet Master for your system.
[ ] True
[x] False

2. Facter stores facts as pairs of:
[ ] variables and values
[x] keys and values
[ ] node names and values
[ ] resource names and values

3. Custom facts can be written using Ruby.
[x] True
[ ] False

4. Facts are top-scope variables. What is considered a best practice for referencing facts in your manifests?
[ ] $factname
[ ] "$factname"
[x] ${::factname}
[ ] {$factname}

5. External facts provide a way to use arbitrary executables or scripts as facts.
[x] True
[ ] False