require "active_support/all"

module Crowdbase
  class << self
    def root
      Pathname.new File.expand_path(File.join(File.dirname(__FILE__), ".."))
    end # def root
    
    def seed_data_folder
      @seed_data_folder ||= YEL.root.join("seeds")
    end # def seed_data_folder
    
    def env
      @env ||= ENV["ENVIRONMENT"]
    end # def env
  end # class << self
end # module Crowdbase

include Crowdbase

require Crowdbase.root.join("lib/crowdbase/core/constants")
require Crowdbase.root.join("lib/crowdbase/client/client")