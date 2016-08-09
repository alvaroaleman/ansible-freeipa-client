# 1.3.0

Alvaro Aleman (10):

* Use complex args style
* More style
* Fix defaults for Trusty
* Fix variable namespace for package var
* Update supported distros
* Update sample playbook
* Set test variables in playbook instead of Vagrantfile
* Add assertion for required variables
* Update role name in README
* Add xenial to supported distros

Tomas Dobrovolny (4):

* Make DNS updates optional
* Correct syntax using variable packages in with_items
* Run Ubuntu specific tasks for all Debians
* Add Ubuntu-16 to supported distributions

# 1.2.0

Alvaro Aleman (3):

* Fix changelog ordering
* Allow to register all routable client ips on DNS
* Dont replace all DNS servers

# 1.1.0

Alvaro Aleman (14):

* Move variables to role-specific namespace
* Add consistent role tag
* Refactor supported_distribution check for readability
* Add Makefile to make testing easier
* Make Vagrant not set DNS server by default
* Use public ipa server for testing
* Fix dependencies
* Add no_ntp parameter
* Add force_join parameter
* Make hostname parameter optional
* Fix checkmode
* Remove obsolete serverspec testing
* Refactor join for readability
* Add contribution guidelines

Casey Labs (2):

* Update Ubuntu tasks
* Adding SSH restart to handlers

# 1.0.0

Alvaro Aleman (8):

* Populate galaxy info
* Update documentation
* Disable unused Docker testing
* Fix naming
* Fix Vagrant testing
* Add *.swp files to gitignore
* Update testing mechanism
* init

# 0.0.1

* Initial commit


<!-- vim: set nofen ts=4 sw=4 et: -->
