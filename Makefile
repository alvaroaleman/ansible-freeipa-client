LOGFILE = /tmp/ansible-freeipaclient-logfile

default: test

clean:
	- vagrant destroy -f

box: clean
	# Start vagrant box
	vagrant up --no-provision --provider $(ANSIBLE_FREEIPACLIENT_VAGRANT_PROVIDER)

checkmode:
	# Test checkmode
	ANSIBLE_FREEIPACLIENT_VAGRANT_ANSIBLE_CHECKMODE=1 vagrant provision

provision:
	# Test role
	vagrant provision

idempotence:
	# Idempotence test
	vagrant provision | tee $(LOGFILE) | grep 'changed=0.*failed=0' || (cat $(LOGFILE) && false)


test: box checkmode provision idempotence
	make checkmode
