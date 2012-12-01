module Crowdbase
  
  class ConfigurationError < StandardError
    def initialize(config_file)
      message = "Missing or malformed configuration file: #{config_file}"
      super(message)
    end # def initialize
  end # class ConfigurationError
  
end # module Crowdbase