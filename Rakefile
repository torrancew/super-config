require 'rdoc/task'
require 'rake/testtask'
require 'bundler/gem_tasks'

RDoc::Task.new(:clobber_rdoc => 'rdoc:clean', :rerdoc => 'rdoc:force') do |t|
  t.rdoc_dir = 'doc/html'
end

# Unit Test Task
Rake::TestTask.new(:unit) do |t|
  t.libs << 'test'
  t.verbose    = true
  t.test_files = FileList['test/test_*.rb']
end

# Spec Task
Rake::TestTask.new(:spec) do |t|
  t.libs << 'spec'
  t.verbose    = true
  t.test_files = FileList['spec/*_spec.rb']
end

# Run All Tests
task :test => [:unit, :spec]

