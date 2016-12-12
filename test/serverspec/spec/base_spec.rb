require 'spec_helper'

region = @properties['timezone::region']
locality = @properties['timezone::locality']

if os[:family] == 'redhat'

  describe file('/etc/selinux/config') do
    it { should exist }
    it { should be_file }
    it { should contain 'SELINUX=disabled' }
  end

  describe file('/etc/sysconfig/clock') do
    it { should exist }
    it { should be_file }
    it { should contain "ZONE=\"#{region}/#{locality}\"" }
  end

end

# the serverspec module installs the ruby package
describe package('ruby') do
  it { should be_installed }
end
