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
    
    def notes
      notes = perform_authorized_request!(GET, NOTES_URL)
      notes.map { |note| Note.new(note) }
    end # def notes
    
    def featured_notes
      featured_notes = perform_authorized_request!(GET, NOTES_URL)
      featured_notes.map { |note| Note.new(note) }
    end # def featured_notes
    
    def links
      links = perform_authorized_request!(GET, LINKS_URL)
      links.map { |link| Link.new(link) }
    end # def links
    
    def featured_links
      featured_links = perform_authorized_request!(GET, FEATURED_LINKS_URL)
      featured_links.map { |link| Linw.new(link) }
    end # def featured_links
    
  end # module Methods
end # module Crowdbase