lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "rake"
require "crowdbase/core/version"

Gem::Specification.new do |s|
  s.name        = "crowdbase"
  s.version     = Crowdbase::Version.number
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Gheorghita Catalin Bordianu"]
  s.email       = ["george@yourextralife.com"]
  s.homepage    = "http://www.crowdbase.com"
  s.summary     = %Q{Wrapper around the API of Crowdbase}
  s.description = %Q{Adds an extra layer of abstraction on top of Crowdbase' API}
  
  s.required_rubygems_version = ">= 1.8"
  
  s.add_development_dependency "rake", ">= 0.9"
  s.add_development_dependency "rspec", ">= 2.0"
  
  s.add_dependency "activesupport", ">= 3.2"
  s.add_dependency "toystore", ">= 0.10"
  
  s.add_dependency "log4r", ">= 1.1"
  
  s.add_dependency "excon", ">= 0.14"
  s.add_dependency "yajl-ruby", ">= 1.1"
  
  s.files         = FileList["lib/**/*.rb", "bin/*", "[A-Z]*", "config/**/*", "spec/**/*"].to_a
  s.test_files    = FileList["spec/**/*"].to_a
  s.require_paths = ["lib", "."]
end # Gem::Specification.new