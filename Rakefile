require 'rake/testtask'
require 'rdoc/task'
require 'bundler/gem_tasks'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the search_sniffer plugin.'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

desc 'Generate documentation for the search_sniffer plugin.'
RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'SearchSniffer'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
