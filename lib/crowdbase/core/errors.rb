module Crowdbase
  
  class ConfigurationError < StandardError
    def initialize(config_file)
      message = "Missing or malformed configuration file: #{config_file}"
      super(message)
    end # def initialize
  end # class ConfigurationError
  
  class InvalidCredentialsError < StandardError
    def initialize(message)
      message = "Invalid credentials sent!" unless message
      super
    end # def initialize
  end # class InvalidCredentialsError
  
end # module Crowdbase