require 'puppetlabs_spec_helper/module_spec_helper'

root_path = File.expand_path(File.join(__FILE__, '..', '..'))

RSpec.configure do |c|
  c.default_facts = YAML.load_file File.join(root_path, 'spec/default_facts.yaml')
end
