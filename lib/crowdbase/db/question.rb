module Crowdbase
  class Question < Post
    
    def initialize(*args)
      super
      self.type = self.class.to_s
    end # def initialize
  end # class Question
end # module Crowdbase