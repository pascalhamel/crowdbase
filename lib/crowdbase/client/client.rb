module Crowdbase
  class Client < DataModel
    
    attribute :client_id, String
    attribute :client_secret, String
    attribute :subdomain, String
    
    attribute :user_id, String
    attribute :access_token, String
    
    validates_presence_of :client_id
    validates_presence_of :client_secret
    validates_presence_of :subdomain
    
    def authorize!(username, password)
      raise ArgumentError, "Invalid username" if (username.blank?) || (!username.kind_of? String) || (!(username =~ EMAIL_REGEXP))
      raise ArgumentError, "Invalid password" if (password.blank?) || (!password.kind_of? String)
      
      if self.valid?
        post_body = post_body_for_authentication
        post_body = "#{post_body}&username=#{username}&password=#{password}"
        
        result = JSON.parse Excon.post(ACCESS_TOKEN_ENDPOINT, :body => post_body).body
        result.symbolize_keys!
        
        access_token, user_id = result[:access_token], result[:user_id]
        raise InvalidCredentialsError if access_token.blank? || user_id.blank?
        
        self.access_token = access_token
        self.user_id = user_id
        true
      end # if the client_id, secret and subdomain are present
    rescue Excon::Errors::SocketError => ex
      Log.error "Unable to access the Crowdbase API. Reason: #{ex.inspect}"
      false
    rescue => ex
      Log.error "Unable to retrieve access token! Reason: #{ex.inspect}"
      false
    end # def authorize!
    
    def authenticated?
      self.access_token.blank?
    end # def authenticated
    
    def post_body_for_authentication
      "client_id=#{self.client_id}&client_secret=#{self.client_secret}&subdomain=#{subdomain}&grant_type=#{PASSWORD_GRANT_TYPE}"
    end # def post_body_for_authentication
    private :post_body_for_authentication
    
    class << self
      def from_yml_config!(config_file)
        raise ConfigurationError, config_file unless File.exist? config_file
        config_hash = (YAML.load ERB.new(File.read(config_file)).result).with_indifferent_access.symbolize_keys
        
        mandatory_keys = [:client_id, :client_secret]
        mandatory_keys.each do |key|
          raise ConfigurationError, config_file unless config_hash.keys.include? key
        end # for each mandatory key
        
        client = self.new(
          :client_id => config_hash[:client_id], 
          :client_secret => config_hash[:client_secret],
          :subdomain => config_hash[:subdomain]
        )
        
        client
      end # def from_yml_config!
    end # class << self
    
  end # class Client
end # module Crowdbase