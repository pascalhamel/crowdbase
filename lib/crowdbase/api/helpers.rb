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

    def post_body_from_data(data)
      raise MalformedResourceError, "Invalid post data: #{data}" unless data.kind_of? Hash
      data_type = data[:type] || TOKEN

      raise MalformedResourceError, "Unknown resource type: #{data_type}" unless CROWDBASE_RESOURCES.include? data_type
      case
        when data_type == TOKEN
          post_body_for_authentication
        else
          data.map { |k, v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v)}" unless k == :type || v.blank? }.compact.join("&")
      end
    end # def post_body_from_data

  end # module Helpers
end # module Crowdbase