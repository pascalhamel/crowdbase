module Crowdbase
  module Methods
    
    def me
      User.new(perform_authorized_request!(GET, ME_URL))
    end # def me
    
    def following
      followings = perform_authorized_request!(GET, FOLLOWING_URL)
      followings.map { |following| User.new(following) }
    end # def following
    
    def followers
      followers = perform_authorized_request!(GET, FOLLOWERS_URL)
      followers.map { |followers| User.new(followers) }
    end # def followers
    
  end # module Methods
end # module Crowdbase