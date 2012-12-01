module Crowdbase
  module Methods
    
    def me
      result = perform_authorized_request!(GET, ME_URL)
    end # def me
    
  end # module Methods
end # module Crowdbase