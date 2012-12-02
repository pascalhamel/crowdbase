module Crowdbase
  class Note < Post
    
    attribute :text, String
    
    def post!
      if self.valid?
        Client.instance.post_note(:title => self.title, :body => self.text, :section_id => self.section_id)
        true
      else
        Log.warn "Cannot post an invalid note: #{self.errors.messages}"
        false
      end
    end # post!
  end # class Note
end # module Crowdbase