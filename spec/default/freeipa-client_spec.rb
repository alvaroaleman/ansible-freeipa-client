require 'spec_helper'

# write up RSpec integration tests here
#   see: http://serverspec.org/resource_types.html

if ENV['IPA_TEST_EXISTING_USER']
  describe user(ENV['IPA_TEST_EXISTING_USER']) do
    it { should exist }
  end
  describe command('sudo -l -U ' + ENV['IPA_TEST_EXISTING_USER']) do
    its(:stdout) { should contain(ENV['IPA_TEST_EXISTING_USER_SUDO_PRIVILEGES']) }
  end
end
