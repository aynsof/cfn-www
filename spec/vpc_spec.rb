require 'awspec'

describe vpc('vpc-test') do
  it { should exist }
  it { should be_available }
  its(:cidr_block) { should eq '10.0.0.0/16' }
  it { should have_route_table('A Private') }
  it { should have_route_table('B Private') }
  it { should have_route_table('C Private') }
  it { should have_route_table('A Public') }
  it { should have_route_table('B Public') }
  it { should have_route_table('C Public') }
end

describe internet_gateway('vpc-test-igw') do
  it { should exist }
  it { should be_attached_to('jk-test')}
end

describe subnet('A public') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Reach').value('public') }
end

describe subnet('A private') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Reach').value('private') }
end

describe subnet('B public') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Reach').value('public') }
end

describe subnet('B private') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Reach').value('private') }
end

describe subnet('C public') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Reach').value('public') }
end

describe subnet('C private') do
  it { should exist }
  it { should be_available }
  it { should have_tag('Reach').value('private') }
end