begin
  require 'bundler'
  require 'bundler/gem_tasks'
  require 'rspec/core/rake_task'
  Bundler.setup
rescue LoadError
  warn 'missing dependencies'
  exit 42
end


gemspec = eval(File.read(Dir['*.gemspec'].first))
file    = [gemspec.name, gemspec.version].join('-') + '.gem'

desc 'Validate the gemspec'
task :gemspec do
  gemspec.validate
end

RSpec::Core::RakeTask.new(:spec)

desc "Clean automatically generated files"
task :clean do
  FileUtils.rm_rf "gems"
end

desc 'Tag the release'
task :tag do
  system "git tag #{gemspec.version}"
  end

desc 'Push to rubygems'
task :push => :tag do
    system "gem push pkg/#{file}"
end

task default: :spec
