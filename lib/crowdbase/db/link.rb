module Crowdbase
  class Link < Post
    attribute :url, String
    
    attribute :description, String
    attribute :excerpt, String
    
    validates_format_of :url, :with => URL_REGEXP
  end # class Link
end # module Crowdbase