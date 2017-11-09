require 'spec_helper'

describe 'tuned' do
  it { should compile }
  it { should contain_class('tuned::install') }
  it { should contain_class('tuned::service') }

  context 'without tuned_version fact' do
    let(:facts) {{
      tuned_version: '',
    }}
    it { should compile }
  end

end
