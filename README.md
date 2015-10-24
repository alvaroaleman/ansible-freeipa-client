# ansible-freeipa-client

## Description

This role allows to join clients to an ipa domain

## Requirements

* CentOS 7
* Fedora 22
* Ubuntu Trusty

## Role Variables

* ``hostname``: The hostname to use for the client (string, mandatory)
* ``server``: IP/Hostname of IPA server to use (string, mandatory)
* ``domain``: Domain to use (string, mandatory)
* ``enroll_user``: Username to enroll host in domain (string, mandatory)
* ``enroll_pass``: Password to enroll host in domain (string, mandatory)
* ``dns_server``: DNS server to configure. This will not do anything if variable is empty (string)

## Example Playbook

```yaml
- hosts: all
  roles:
     - { role: ansible-freeipa-client }
```

## License

GNU AFFERO GENERAL PUBLIC LICENSE Version 3

## Contributing

If you want to contribute to this repository please be aware that this
project uses a [gitflow](http://nvie.com/posts/a-successful-git-branching-model/)
workflow with the next release branch called ``next``.

Please fork this repository and create a local branch split off of the ``next``
branch and create pull requests back to the origin ``next`` branch.

## Integration testing

This role provides integration tests using the Ruby RSpec/serverspec framework
with a few drawbacks at the time of writing this documentation.

Running integration tests requires a number of dependencies being
installed. As this role uses Ruby RSpec there is the need to have
Ruby with rake and bundler available.

```bash
# Install role specific dependencies with bundler
bundle install

# Run the complete test suite with Vagrant
source envvars-vagrant.sample
rake suite
```

The settings required to test this role are configured using environment variables,
samples can be found in the ``envvars-vagrant.sample`` file.

## Author information

Alvaro Aleman

<!-- vim: set nofen ts=4 sw=4 et: -->
