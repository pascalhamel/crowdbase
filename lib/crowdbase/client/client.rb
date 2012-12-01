module Crowdbase
  class Client < DataModel
    
    attribute :client_id, String
    attribute :client_secret, String
    attribute :subdomain, String
    
    attribute :access_token, String
    
    validates_presence_of :client_id
    validates_presence_of :client_secret
    validates_presence_of :subdomain
    
    def authenticate!
      if self.valid?
        Excon.get()
      end
      false
    rescue Excon::Errors::SocketError => ex
      # TODO: Log a message
    end # def authenticate!
    
    def authenticated?
      self.access_token.blank?
    end # def authenticated
    
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