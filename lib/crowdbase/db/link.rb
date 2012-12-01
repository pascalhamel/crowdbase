module Crowdbase
  class Link < Post
    
    attribute :title, String
    attribute :url, String
    
    attribute :description, String
    attribute :excerpt, String
    
    validates_presence_of :title
    validates_format_of :url, :with => URL_REGEXP
    
  end # class Link
end # module Crowdbase