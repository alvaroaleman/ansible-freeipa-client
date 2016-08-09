# ansible-freeipa-client

## Synopsis

```yaml
- hosts: all
  vars:
    freeipaclient_server: ipa.demo1.freeipa.org
    freeipaclient_domain: ipa.demo1.freeipa.org
    freeipaclient_enroll_user: admin
    freeipaclient_enroll_pass: Secret123
  roles:
     - alvaroaleman.freeipa-client
```

## Description

This role allows to join clients to an ipa domain

## Requirements

* CentOS 7
* Fedora 24
* Ubuntu Trusty
* Ubuntu Xenial

## Role Variables

* ``freeipaclient_server``: IP/Hostname of IPA server to use (string, mandatory)
* ``freeipaclient_domain``: Domain to use (string, mandatory)
* ``freeipaclient_enroll_user``: Username to enroll host in domain (string, mandatory)
* ``freeipaclient_enroll_pass``: Password to enroll host in domain (string, mandatory)
* ``freeipaclient_hostname``: The hostname to use for the client (string, default: output of ``uname -n``)
* ``freeipaclient_dns_server``: DNS server to configure. This will not do anything if variable is empty (string)
* ``freeipaclient_force_join``: Whether to overwrite an already existing host entry of requested name (boolean, default: ``false``)
* ``freeipaclient_enable_ntp``: Whether to enable ntp. Kerberos won't work if the time of master and client drift too much (boolean, default: ``true``)
* ``freeipaclient_all_ip_addresses``: Whether to add all routable ip addresses to DNS (boolean, default: ``true if not Trusty, else false``)


## License

GNU AFFERO GENERAL PUBLIC LICENSE Version 3

## Contributing

If you want to contribute to this repository please be aware that this
project uses a [gitflow](http://nvie.com/posts/a-successful-git-branching-model/)
workflow with the next release branch called ``next``.

Please fork this repository and create a local branch split off of the ``next``
branch and create pull requests back to the origin ``next`` branch.

## Integration testing

This role provides integration tests using Vagrant:

```bash
cp envvars-vagrant.sample envvars
EDITOR=vim
$EDITOR envvars
source envvars
make test
```

## Author information

Alvaro Aleman

<!-- vim: set nofen ts=4 sw=4 et: -->
