module Crowdbase
  API_ENDPOINT = "https://api.crowdbase.com"
  KEY_SCHEMA_REGEXP = /\A[\w\-]+((\:[\w\-]+)*)?\z/
  PASSWORD_GRANT_TYPE = "password"
  
  LOG_DIR = Crowdbase.root.join("logs")
end # module Crowdbase