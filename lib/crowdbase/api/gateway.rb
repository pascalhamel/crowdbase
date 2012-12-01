module Crowdbase
  module Gateway
    
    def perform_request!(verb, url, options = {})
      case
      when verb == GET
        result = JSON.parse Excon.get(url, :headers => options[:headers]).body
      when verb == POST
        result = JSON.parse Excon.post(url, :body => options[:data]).body
      else
        Log.error "Unkown HTTP verb: #{verb}"
        raise ArgumentError "Unknown verb: #{verb}"
      end
      
      result.symbolize_keys!
    rescue Excon::Errors::SocketError => ex
      Log.error "Unable to access the Crowdbase API. Reason: #{ex.inspect}"
      raise APIRequestFailedError, url
    rescue => ex
      Log.error "Internal error: #{ex.inspect}"
      raise APIRequestFailedError, url
    end # def perform_request!
    
    def perform_authorized_request!(verb, url, options = {})
      headers = (options[:headers] || {}).merge! authorization_header
      options[:headers] = headers
      perform_request!(verb, url, options)
    end # def perform_authorized_request!
    
  end # module Gateway
end # module Crowdbase