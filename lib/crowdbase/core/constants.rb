module Crowdbase
  API_ENDPOINT = "https://api.crowdbase.com"
  ACCESS_TOKEN_URL = "#{API_ENDPOINT}/oauth/token"
  
  # API method URLs
  ME_URL = "#{API_ENDPOINT}/v1/me"
  FOLLOWING_URL = "#{ME_URL}/following"
  FOLLOWERS_URL = "#{ME_URL}/followers"
  POSTS_URL = "#{ME_URL}/posts"
  
  NOTES_URL = "#{API_ENDPOINT}/v1/notes"
  FEATURED_NOTES_URL = "#{NOTES_URL}/featured"
  NOTES_SEARCH_URL = "#{NOTES_URL}/search"
  
  LINKS_URL = "#{API_ENDPOINT}/v1/links"
  FEATURED_LINKS_URL = "#{LINKS_URL}/featured"
  LINKS_SEARCH_URL = "#{LINKS_URL}/search"
  
  QUESTIONS_URL = "#{API_ENDPOINT}/v1/questions"
  FEATURED_QUESTIONS_URL = "#{QUESTIONS_URL}/featured"
  QUESTIONS_SEARCH_URL = "#{QUESTIONS_URL}/search"
  
  TOPICS_URL = "#{API_ENDPOINT}/v1/topics"
  USERS_URL = "#{API_ENDPOINT}/v1/users"
  USERS_SEARCH_URL = "#{USERS_URL}/search"
  
  # Various useful regular expressions
  EMAIL_REGEXP = /^([\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+\.)*[\w\!\#$\%\&\'\*\+\-\/\=\?\^\`{\|\}\~]+@((((([a-z0-9]{1}[a-z0-9\-]{0,62}[a-z0-9]{1})|[a-z])\.)+[a-z]{2,6})|(\d{1,3}\.){3}\d{1,3}(\:\d{1,5})?)$/i
  URL_REGEXP = /\Ahttps?:\/\/[\S]+\z/i
  
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