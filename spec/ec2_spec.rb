require 'awspec'

describe autoscaling_group('vpc-test-wwwASG-1N3QDD3QIXVLG') do
    it { should exist }
    it { should have_alb_target_group('vpc-test-alb-target-group') }
end

describe security_group('cloudfront_r') do
    it { should exist }
end

describe security_group('cloudfront_g') do
    it { should exist }
end