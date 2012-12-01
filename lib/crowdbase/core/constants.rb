module Crowdbase
  API_ENDPOINT = "https://api.crowdbase.com"
  ACCESS_TOKEN_URL = "#{API_ENDPOINT}/oauth/token"
  
  # API Methods
  ME_URL = "#{API_ENDPOINT}/v1/me"
  
  # Various useful regular expressions
  KEY_SCHEMA_REGEXP = /\A[\w\-]+((\:[\w\-]+)*)?\z/
  EMAIL_REGEXP = /^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i
  
  # Application constants
  PASSWORD_GRANT_TYPE = "password"
  LOG_DIR = Crowdbase.root.join("logs")
  
  # API constants
  GET = "get"
  POST = "post"
  PUT = "put"
  DELETE = "delete"
  
  HTTP_VERBS = [GET, POST, PUT, DELETE]
end # module Crowdbase