Consul FS
=========

Proof-of-concept fuse adapter for Consul KV store. Allows you to browse the
store as a filesystem.

Only works on linux.

    apt-get install libfuse-dev

    gem install consul-fs
    mkdir consul-kv

    consul-fs consul-kv

That mounts a fuse system in the `consul-kv` directory.

    > curl -X PUT --data "hello" localhost:8500/v1/kv/one
    > curl -X PUT --data "world" localhost:8500/v1/kv/two
    > curl -X PUT --data "!!!" localhost:8500/v1/kv/sub/three
    > ls consul-kv
    sub/ one two
    > ls consul-kv/sub
    three
    > cat consul-kv/one && echo
    hello


Development
-----------

A `Vagrantfile` is provided, so just `vagrant up` and you are on your way.
