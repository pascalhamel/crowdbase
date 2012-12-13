module Crowdbase
  class Link < Post
    attribute :url, String
    
    attribute :description, String
    attribute :excerpt, String
    
    validates_format_of :url, :with => URL_REGEXP

    def post!
      if self.valid?
        Client.instance.post_link(:title => self.title, :url => self.url, :description => self.description, :section_id => self.section_id)
        true
      else
        Log.warn "Cannot post an invalid question: #{self.errors.messages}"
        false
      end
    end # post!
  end # class Link
end # module Crowdbase