require Crowdbase.root.join("lib/crowdbase/core/logger")
require Crowdbase.root.join("lib/crowdbase/core/utils")
require Crowdbase.root.join("lib/crowdbase/core/constants")
require Crowdbase.root.join("lib/crowdbase/core/errors")

module Crowdbase
  module Core
    class << self
      def initialize!
        Dir.mkdir(LOG_DIR) unless Dir.exists?(LOG_DIR)
        Log.initialize_outputters
        true
      rescue => ex
        puts "Core initialization failed!. Reason: #{ex.inspect}"
        false
      end # def initialize!
    end # class << self
  end # module Core
end # module Crowdbase