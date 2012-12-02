module Crowdbase
  module Gateway
    
    def perform_request!(verb, url, options = {})
      case
      when verb == GET
        result = JSON.parse Excon.get(url, :headers => options[:headers]).body
      when verb == POST
        post_body = post_body_from_data(options[:data] || {})
        headers = options[:headers] || {}
        
        result = JSON.parse Excon.post(url, :body => post_body, :headers => headers).body
      else
        Log.error "Unkown HTTP verb: #{verb}"
        raise ArgumentError "Unknown verb: #{verb}"
      end
      
      parse_result(result.symbolize_keys!)
    rescue *CROWDBASE_API_ERRORS => ex
      Log.warn "Request unsuccessful: #{ex.inspect}"
      nil
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
    
    def parse_result(result)
      return result.symbolize_keys! unless result[:code]      
      status = result[:code]
      
      case
      when status == 200
        result = result[:body]
        if result.kind_of? Array
          result.map { |elem| elem.symbolize_keys! }
        elsif result.kind_of? Hash
          result.symbolize_keys!
        else
          result
        end # symbolize the keys of the result
      when status == 503
        raise APIScheduledMaintenanceError
      when status == 500
        raise APIInternalServerError
      when status == 400
        raise APIBadRequestError
      when status == 401
        raise APIUnauthorizedError
      else
        raise APIRequestFailedError
      end
    end # def parse_result
    
  end # module Gateway
end # module Crowdbase