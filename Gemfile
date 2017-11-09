source ENV['GEM_SOURCE'] || "https://rubygems.org"
puppetversion = ENV['PUPPET_GEM_VERSION'] || '~> 4.10.0'

group :development, :unit_tests do
  gem 'r10k',                    :require => false
  gem 'rake', ['< 11'],          :require => false
  gem 'rspec-puppet', ['>=2.5.0'], :require => false
  gem 'puppetlabs_spec_helper',  :require => false
  gem 'puppet-lint',             :require => false
  gem 'puppet_facts',            :require => false
  gem 'safe_yaml',               :require => false
  gem 'deep_merge',              :require => false
  gem 'parallel_tests',          :require => false
  gem 'puppet-lint-duplicate_class_parameters-check', :require => false
  gem 'puppet-lint-no_symbolic_file_modes-check', ['>=1.0.1'], :require => false
  gem 'CFPropertyList',          :require => false
  gem 'rubocop',                 :require => false
end

gem 'facter', :require => false

gem 'puppet', puppetversion, :require => false

# vim:ft=ruby
