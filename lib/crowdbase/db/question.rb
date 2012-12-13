module Crowdbase
  class Question < Post
    
    def initialize(*args)
      super
      self.type = self.class.to_s
    end # def initialize

    def post!
      if self.valid?
        Client.instance.post_question(:title => self.title, :section_id => self.section_id)
        true
      else
        Log.warn "Cannot post an invalid question: #{self.errors.messages}"
        false
      end
    end # post!
  end # class Question
end # module Crowdbase