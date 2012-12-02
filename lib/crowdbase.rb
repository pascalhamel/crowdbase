require "active_support/all"
require "log4r"
require "pathname"
require "toystore"
require "excon"

module Crowdbase
  class << self
    def root
      Pathname.new File.expand_path(File.join(File.dirname(__FILE__), ".."))
    end # def root
    
    def seed_data_folder
      @seed_data_folder ||= YEL.root.join("seeds")
    end # def seed_data_folder
    
    def env
      @env ||= ENV["ENVIRONMENT"] || "development"
    end # def env
    
    def reload!
      Dir.glob(self.root.join("lib/**/*.rb")).each { |source| load source }
      nil
    end # def reload!
    
    def initialize!
      Core.initialize!
      DB.initialize!
      API.initialize!
    end # def initialize
    
  end # class << self
end # module Crowdbase

include Crowdbase

require Crowdbase.root.join("lib/crowdbase/core/core")
require Crowdbase.root.join("lib/crowdbase/db/db")
require Crowdbase.root.join("lib/crowdbase/api/api")

Crowdbase.initialize!


