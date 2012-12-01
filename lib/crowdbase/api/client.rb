module Crowdbase
  class Client < DataModel
    include Gateway
    include Methods
    include Helpers
    
    attribute :client_id, String
    attribute :client_secret, String
    attribute :subdomain, String
    
    attribute :username, String
    attribute :password, String
    
    attribute :user_id, String
    attribute :access_token, String
    attribute :refresh_token, String
    attribute :expires_at, Time
    
    validates_format_of :username, :with => EMAIL_REGEXP
    validates_presence_of :password
    
    validates_presence_of :client_id
    validates_presence_of :client_secret
    validates_presence_of :subdomain
    
    def initialize(*args)
      super(*args)
      self.authorize! if self.valid?
    end # def initialize
    
    def authorize!(options = {})
      self.username = options[:username] if options[:username]
      self.password = options[:password] if options[:password]
      
      if self.valid?
        result = perform_request!(POST, ACCESS_TOKEN_URL, { :data => post_body_for_authentication })
        access_token, user_id = result[:access_token], result[:user_id]
        raise InvalidCredentialsError if access_token.blank? || user_id.blank?
        
        self.access_token = access_token
        self.user_id = user_id
        
        self.refresh_token = result[:refresh_token] if result[:refresh_token]
        self.expires_at = Time.at(Time.now.to_i +  result[:expires_in].to_i) if result[:expires_in]
        true
      else
        Log.warn "Invalid client credentials. #{self.errors.messages}"
        false
      end # if the client_id, secret and subdomain are present
    rescue APIRequestFailedError => ex
      Log.error "Request failed! #{ex.inspect}"
      false
    end # def authorize!
    
    def authenticated?
      self.access_token.blank?
    end # def authenticated
    
    class << self
      attr_accessor :instance
      
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
          :subdomain => config_hash[:subdomain],
          :username => config_hash[:username],
          :password => config_hash[:password]
        )
        
        self.instance = client
      end # def from_yml_config!
    end # class << self
    
  end # class Client
end # module Crowdbase