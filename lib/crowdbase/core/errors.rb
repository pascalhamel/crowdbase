module Crowdbase
  
  class ConfigurationError < StandardError
    def initialize(config_file)
      message = "Missing or malformed configuration file: #{config_file}"
      super(message)
    end # def initialize
  end # class ConfigurationError
  
  class InvalidCredentialsError < StandardError
    def initialize(message = "Invalid credentials sent!")
      super
    end # def initialize
  end # class InvalidCredentialsError
  
  class MalformedResourceError < StandardError
    def initialize(message = "Malformed resource.")
      super
    end # def initialize
  end # class MalformedResourceError
  
  class APIRequestFailedError < StandardError
    def initialize(url)
      message = "Request failed: #{url}"
      super(message)
    end # def initialize
  end # class APIRequestFailedError
  
  class APIInternalServerError < StandardError
    def initialize(message = "Crowdbase API is down.")
      super
    end # def initialize
  end # class
  
  class APIScheduledMaintenanceError < StandardError
    def initialize(message = "Crowdbase API is down for scheduled maintenance")
      super(message)
    end # def initialize
  end # class APIScheduledMaintenanceError
  
  class APIUnauthorizedRequestError < StandardError
    def initialize(message = "Unauthorized request performed. Check your credentials")
      super(message)
    end # def initialize
  end # class APIUnauthorizedRequestError
  
  class APIBadRequestError < StandardError
    def initialize(message = "Bad request performed.")
      super(message)
    end # def initialize
  end # class APIBadRequestError < StandardError
  
  CROWDBASE_API_ERRORS = [APIInternalServerError, APIScheduledMaintenanceError, APIUnauthorizedRequestError, APIBadRequestError]
  
end # module Crowdbase