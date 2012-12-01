module Crowdbase
  class Topic < DataModel
    attribute :code_name, String
    attribute :title, String
    
    attribute :is_section, Object
    attribute :followed_by_user, Object
    attribute :viewed_by_user, Object
    
    attribute :description, String
    attribute :images, Images
    
    attribute :nb_questions, Integer, :default => 0
    attribute :nb_answers, Integer, :default => 0
    attribute :nb_notes, Integer, :default => 0
    attribute :nb_links, Integer, :default => 0
    attribute :nb_documents, Integer, :default => 0
    attribute :nb_followers, Integer, :default => 0
    attribute :nb_views, Integer, :default => 0
    
    attribute :created_at, Time
    attribute :updated_at, Time
    
    validates_presence_of :code
    validates_presence_of :title
    
    validates_type_of :is_section, :in => [TrueClass, FalseClass]
    validates_type_of :followed_by_user, :in => [TrueClass, FalseClass]
    validates_type_of :viewed_by_user, :in => [TrueClass, FalseClass]
    
    validates_type_of :images, :as => Images
    
    validates_numericality_of :nb_questions, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_answers, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_notes, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_documents, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_followers, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_views, :greater_than_or_equal_to => 0
  end # class Topic
end # module Crowdbase