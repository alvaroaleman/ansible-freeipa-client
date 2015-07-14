# role-freeipa-client

## Description

This role allows to join clients to an ipa domain

## Requirements

### Operating System

* CentOS 7
* Fedora 22
* Ubuntu Trusty

## Role Variables

* ``hostname``: The hostname to use for the client (string, mandatory)
* ``server``: IP/Hostname of IPA server to use (string, mandatory)
* ``domain``: Domain to use (string, mandatory)
* ``dns_server``: DNS server to configure. This will not do anything if variable is empty (string)
* ``enroll_user``: Username to enroll host in domain
* ``enroll_pass``: Password to enroll host in domain

## Dependencies

None

## Example Playbook

    - hosts: all
      roles:
         - { role: role-freeipa-client }

## License

GNU AFFERO GENERAL PUBLIC LICENSE Version 3

## Integration testing

This role provides integration tests using the Ruby RSpec/serverspec framework
with a few drawbacks at the time of writing this documentation.

Running integration tests requires a number of dependencies being
installed. As this role uses Ruby RSpec there is the need to have
Ruby with rake and bundler available.

    # install role specific dependencies with bundler
    bundle install

<!-- -->

    #Not tested: run the complete test suite with Docker
    rake suite

<!-- -->

    #Recommended: run the complete test suite with Vagrant
    RAKE_ANSIBLE_USE_VAGRANT=1 rake suite

The settings required to test this role can be configured using environment variables, e.g.:

    export IPA_TEST_VAGRANT_BOXNAME=centos/7
    export IPA_TEST_SERVER=ipa-server.example.com
    export IPA_TEST_DOMAIN=example.com
    export IPA_TEST_DNS_SERVER=10.10.10.1
    export IPA_TEST_ENROLL_USER=admin
    export IPA_TEST_ENROLL_PASS=foobar
    export IPA_TEST_HOSTNAME=vagrant.example.com

Also, there are some additional settings that will be used to test proper functionality if present:

    export IPA_TEST_EXISTING_USER=example_user
    export IPA_TEST_EXISTING_USER_SUDO_PRIVILEGES='\(ALL : ALL\) ALL' #this is interpreted as regexp, so escaping is necessary

## Author information

Alvaro Aleman

<!-- vim: set nofen ts=4 sw=4 et: -->
