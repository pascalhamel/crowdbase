module Crowdbase
  module Helpers
    
    def post_body_for_authentication
      post_body = "client_id=#{self.client_id}&client_secret=#{self.client_secret}&subdomain=#{subdomain}"
      post_body = "#{post_body}&grant_type=#{PASSWORD_GRANT_TYPE}&username=#{self.username}&password=#{self.password}"
      post_body
    end # def post_body_for_authentication
    
    def authorization_header
      {"Authorization" => "Bearer #{self.access_token}"}
    end # def authorization_header
        
  end # module Helpers
end # module Crowdbase