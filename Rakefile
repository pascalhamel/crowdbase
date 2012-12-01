require "rake/dsl_definition"
require "rake"
require "bundler/setup"
require "rspec/core/rake_task"
require "active_support/core_ext/numeric/time"

task :default => "spec:recent"

task :init do
  root = File.expand_path(File.dirname(__FILE__))
  dirs = [File.join(root, "lib")]
  dirs.select! { |dir| File.directory?(dir) }
  $LOAD_PATH.unshift(*dirs)
  
  require "crowdbase"
end # task :init

desc "Alias for 'rake console'"
task :c => :console

desc "Start IRB with all runtime dependencies loaded"
task :console => :init do |t, args|
  ARGV.clear
  require "irb"
  IRB.start
end # task :console

# Grab recently touched specs
def recent_specs(touched_since, spec_type = "unit")
  recent_specs = []
  Dir["lib/**/*"].map do |path|
    next unless File.exists? path
    if (File.mtime(path) > touched_since)
      spec = File.join("spec/#{spec_type}", "#{File.basename(path, ".*")}_spec.rb")
      (recent_specs << spec) if File.exists? spec
    end # if the file was recently modified
  end # for each file in lib/
  
  # add any recently modified spec file
  Dir["spec/**/*_spec.rb"].select do |spec|
    (recent_specs << spec) if File.mtime(spec) > touched_since
  end
  recent_specs.compact.uniq
end # def recent_specs

SPEC_SUITES = [
  { :id => :all,  :title => "all", :files => %w(spec/**/*_spec.rb) },
  { :id => :unit, :title => "unit test", :files => %w(spec/unit/*_spec.rb) },
  { :id => :integration, :title => "integration test", :files => %w(spec/integration/*_spec.rb) }
]

namespace :spec do
  namespace :suite do
    SPEC_SUITES.each do |suite|
      desc "Run all specs in #{suite[:title]} spec suite"
      RSpec::Core::RakeTask.new(suite[:id]) do |t|
        spec_files = []
        if suite[:files]
          suite[:files].each { |glob| spec_files += Dir[glob] }
        end

        if suite[:dirs]
          suite[:dirs].each { |glob| spec_files += Dir["#{glob}/**/*_spec.rb"] }
        end

        t.rspec_opts = ["-c", "-f documentation"]
        t.pattern = spec_files
      end # task :suite:suite_name
    end # each spec suite
  end # namespace :suite
  
  desc "Run all recent specs for code files edited in the past 10 minutes"
  RSpec::Core::RakeTask.new(:recent) do |t|
    t.rspec_opts = ["-c", "-f documentation"]
    t.pattern = recent_specs(Time.now - 10.minutes)
  end # task spec:recent
end # namespace :spec