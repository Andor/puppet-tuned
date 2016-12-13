require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'rubocop/rake_task'

RuboCop::RakeTask.new

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  config.fail_on_warnings = true
  config.disable_checks = [
    '80chars',
    'class_inherits_from_params_class',
    'class_parameter_defaults',
    'documentation',
    # 'single_quote_string_with_variables',
  ]
  config.ignore_paths = ["spec/**/*.pp", "pkg/**/*.pp", "modules/**/*.pp", "vendor/**/*.pp"]
end

PuppetSyntax.fail_on_deprecation_notices = false
PuppetSyntax.hieradata_paths = ["hieradata/**/*.yaml", "hieradata/*.yaml"]

desc 'Run tests in parallel'
task :runtests do
  Rake::Task['syntax'].invoke
  Rake::Task['teamcity:parallel_rspec'].invoke
end

namespace :teamcity do
  task :parallel_rspec do
    sh('parallel_rspec spec --serialize-stdout')
  end
end

# vim: set ts=2 sw=2 cin et :
