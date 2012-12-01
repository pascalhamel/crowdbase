module Crowdbase
  class Images < DataModel
    
    attribute :avatar_url, String
    attribute :cover_art_url, String
    attribute :image_url, String
    
    validates_format_of :avatar_url, :with => URL_REGEXP, :allow_nil => true
    validates_format_of :cover_art_url, :with => URL_REGEXP, :allow_nil => true
    validates_format_of :image_url, :with => URL_REGEXP, :allow_nil => true
    
  end #  class Images
end # module Crowdbase