# vim: set ft=ruby ts=2 sw=2 et:
# -*- mode: ruby -*-


VAGRANT_API_VERSION = '2'
Vagrant.configure(VAGRANT_API_VERSION) do |config|

  if ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_BOXNAME']
    config.vm.box = ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_BOXNAME']
  else
    config.vm.box = 'ubuntu/trusty64'
  end

  config.vm.define :ansiblefreeipaclienttest do |d|

    d.vm.hostname = 'ansiblefreeipaclienttest'
    d.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true

    d.vm.provision :ansible do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.tags = ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_ANSIBLE_TAGS']
      ansible.skip_tags = ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_ANSIBLE_SKIP_TAGS']
      ansible.verbose = ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_ANSIBLE_VERBOSE']
      if ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_ANSIBLE_CHECKMODE'] == '1'
        ansible.raw_arguments = '--check'
      end
      ansible.groups = {
        'vagrant' => ['ansiblefreeipaclienttest']
      }
      ansible.limit = 'vagrant'
      ansible.raw_arguments = [
        '--diff'
      ]
      if ENV['ANSIBLE_FREEIPACLIENT_VAGRANT_ANSIBLE_CHECKMODE'] == '1'
        ansible.raw_arguments << '--check'
      end

      ::File.directory?('.vagrant/provisioners/ansible/inventory/') do
        ansible.inventory_path = '.vagrant/provisioners/ansible/inventory/'
      end

      dnsvars = {
        server: ENV['IPA_TEST_SERVER'],
        domain: ENV['IPA_TEST_DOMAIN'],
        dns_server: ENV['IPA_TEST_DNS_SERVER'],
        enroll_user: ENV['IPA_TEST_ENROLL_USER'],
        enroll_pass: ENV['IPA_TEST_ENROLL_PASS'],
        hostname: ENV['IPA_TEST_HOSTNAME']
      }
      nodnsvars = {
        server: ENV['IPA_TEST_SERVER'],
        domain: ENV['IPA_TEST_DOMAIN'],
        enroll_user: ENV['IPA_TEST_ENROLL_USER'],
        enroll_pass: ENV['IPA_TEST_ENROLL_PASS'],
        hostname: ENV['IPA_TEST_HOSTNAME']
      }

      if ENV['IPA_TEST_DNS_SERVER']
        ansible.extra_vars = dnsvars
      else
        ansible.extra_vars = nodnsvars
      end


    end

    d.vm.provider :virtualbox do |v|
      v.customize 'pre-boot', ['modifyvm', :id, '--nictype1', 'virtio']
      v.customize [ 'modifyvm', :id, '--name', 'ansiblefreeipaclienttest', '--memory', '512', '--cpus', '1' ]
    end

    d.vm.provider :libvirt do |lv|
      lv.memory = 1024
      lv.cpus = 2
    end


  end
end
