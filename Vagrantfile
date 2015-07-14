# vim: set ft=ruby ts=2 sw=2 et:
# -*- mode: ruby -*-


VAGRANT_API_VERSION = '2'
Vagrant.configure(VAGRANT_API_VERSION) do |config|

  config.vm.box = ENV['IPA_TEST_VAGRANT_BOXNAME']

  config.vm.define :ansiblefreeipa_clienttest do |d|

    d.vm.hostname = 'ansiblefreeipaclienttest'
    d.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true

    d.vm.provider :libvirt do |domain|
      domain.memory = 2048
      domain.cpus = 2
    end

    d.vm.provision :ansible do |ansible|
      ansible.playbook = 'tests/playbook.yml'
      ansible.tags = ENV['ANSIBLE_TAGS']
      ansible.groups = {
        'vagrant' => ['ansiblefreeipa_clienttest'],
      }
      ansible.extra_vars = {
        server: ENV['IPA_TEST_SERVER'],
        domain: ENV['IPA_TEST_DOMAIN'],
        dns_server: ENV['IPA_TEST_DNS_SERVER'],
        enroll_user: ENV['IPA_TEST_ENROLL_USER'],
        enroll_pass: ENV['IPA_TEST_ENROLL_PASS'],
        hostname: ENV['IPA_TEST_HOSTNAME']
      }
      ansible.limit = 'vagrant'

      ::File.directory?('.vagrant/provisioners/ansible/inventory/') do
        ansible.inventory_path = '.vagrant/provisioners/ansible/inventory/'
      end

    end

    d.vm.provider :virtualbox do |v|
      v.customize 'pre-boot', ['modifyvm', :id, '--nictype1', 'virtio']
      v.customize [ 'modifyvm', :id, '--name', 'ansiblefreeipa-clienttest', '--memory', '2048', '--cpus', '2' ]
    end

  end
end
