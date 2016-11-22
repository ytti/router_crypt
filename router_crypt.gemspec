Gem::Specification.new do |s|
  s.name              = 'router_crypt'
  s.version           = '0.4.0'
  s.platform          = Gem::Platform::RUBY
  s.authors           = [ 'Saku Ytti' ]
  s.email             = %w( saku@ytti.fi )
  s.homepage          = 'http://github.com/ytti/router_crypt'
  s.summary           = 'Crypt library for JunOS/IOS/NX-OS passwords'
  s.description       = 'Library and binary which decrypt (crypt unimplemented) Juniper JunOS $9$, Cisco IOS type 7 and Cisco NX-OS passwords'
  s.rubyforge_project = s.name
  s.files             = `git ls-files`.split("\n")
  s.executables       = %w( rtrcrypt )
  s.require_path      = 'lib'
  s.required_rubygems_version = '>= 1.3.6'
  s.add_runtime_dependency 'slop', '~> 4.4'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
