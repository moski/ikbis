require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rcov/rcovtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "ikbis"
    s.summary = "This gem implements a full-featured ruby interface for the Ikbis API."
    s.email = "abushaikh@gmail.com"
    s.homepage = "http://github.com/moski/ikbis"
    s.description = "This gem implements a full-featured ruby interface for the Ikbis API."
    s.authors = ["Moski Doski"]
    s.add_dependency('multipart-post', '>= 1.0')
    s.add_dependency('httparty', '>= 0.5.0')
    s.add_dependency('oauth', '>= 0.3.6')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'ikbis'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Rcov::RcovTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

task :default => :rcov
