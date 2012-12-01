module Crowdbase
  module Methods
    
    def me
      perform_authorized_request!(GET, ME_URL)
    end # def me
    
  end # module Methods
end # module Crowdbase