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
      super(message)
    end # def initialize
  end # class InvalidCredentialsError
  
  class APIRequestFailedError < StandardError
    def initialize(url)
      message = "Request failed: #{url}"
      super(message)
    end # def initialize
  end # class APIRequestFailedError
  
  class APIInternalServerError < StandardError
    def initialize(message)
      message = "Crowdbase API is down." unless message
      super(message)
    end # def initialize
  end # class
  
  class APIScheduledMaintenanceError < StandardError
    def initialize(message)
      message = "Crowdbase API is down for scheduled maintenance" unless message
      super(message)
    end # def initialize
  end # class APIScheduledMaintenanceError
  
  class APIUnauthorizedRequestError < StandardError
    def initialize(message)
      message = "Unauthorized request performed. Check your credentials" unless message
      super(message)
    end # def initialize
  end # class APIUnauthorizedRequestError
  
  class APIBadRequestError < StandardError
    def initialize(message)
      message = "Bad request performed." unless message
      super(message)
    end # def initialize
  end # class APIBadRequestError < StandardError
  
  CROWDBASE_API_ERRORS = [APIInternalServerError, APIScheduledMaintenanceError, APIUnauthorizedRequestError, APIBadRequestError]
  
end # module Crowdbase