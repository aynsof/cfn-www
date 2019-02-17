require 'awspec'

describe alb('vpc-test-loadbalancer') do
  it { should exist }
  it { should be_active }
  it { should have_security_group('vpc-test-cfgSecurityGroup-122I4S6680PF2') }
  it { should have_subnet('subnet-01acb03c2f94a85ad') }
  it { should belong_to_vpc('vpc-test') }
end

describe alb_target_group('vpc-test-alb-target-group') do
    it { should exist }
    its(:health_check_path) { should eq '/' }
    its(:health_check_protocol) { should eq 'HTTP' }
    it { should belong_to_vpc('vpc-test') }
end