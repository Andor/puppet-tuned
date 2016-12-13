require 'spec_helper'

describe 'tuned' do
  it { should compile }
  it { should contain_class('tuned::install') }
  it { should contain_class('tuned::service') }
end
