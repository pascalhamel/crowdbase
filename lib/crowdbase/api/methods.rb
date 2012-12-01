module Crowdbase
  module Methods
    
    def me
      resource = perform_authorized_request!(GET, ME_URL)
      user = User.new(resource)
      user.stats = Stats.new(resource)
      user
    end # def me
    
  end # module Methods
end # module Crowdbase