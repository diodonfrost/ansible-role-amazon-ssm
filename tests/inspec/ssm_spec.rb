amazon_ssm_package = 'amazon-ssm-agent'
amazon_ssm_service = 'amazon-ssm-agent'
amazon_ssm_service = 'snap.amazon-ssm-agent.amazon-ssm-agent.service' if os.name == 'ubuntu' && os[:release].to_i >= 18

control 'ssm-01' do
  impact 1.0
  title 'Amazon ssm install'
  desc 'Amazon ssm agent should be installed'
  describe.one do
    describe package(amazon_ssm_package) do
      it { should be_installed }
    end
    describe command('snap info amazon-ssm-agent') do
      its('exit_status') { should eq 0 }
    end
  end
end

control 'ssm-02' do
  impact 1.0
  title 'Amazon ssm service'
  desc 'Amazon ssm agent service should be started and enabled'
  describe.one do
    describe service(amazon_ssm_service) do
      it { should be_enabled }
      it { should be_running }
    end
    describe upstart_service(amazon_ssm_service) do
      it { should be_enabled }
      it { should be_running }
    end
  end
end

control 'ssm-03' do
  impact 1.0
  title 'Amazon ssm sudoers'
  desc 'Sudo file used by Amazon ssm user should be present'
  describe file('/etc/sudoers.d/ssm-agent-users') do
    it { should exist }
    its('mode') { should cmp '0440' }
  end
end
