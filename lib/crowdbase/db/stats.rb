module Crowdbase
  class Stats < DataModel
    attribute :nb_notes, Integer
    attribute :nb_links, Integer
    attribute :nb_questions, Integer
    
    attribute :nb_followers, Integer
    attribute :nb_followed_users, Integer
    attribute :nb_followed_topics, Integer
    
    attribute :nb_liked_notes, Integer
    attribute :nb_liked_links, Integer
    attribute :nb_liked_questions, Integer
    attribute :nb_liked_documents, Integer
    
    attribute :nb_thanks_received, Integer
    attribute :nb_thanks_sent, Integer
    
    attribute :nb_upvotes_received, Integer
    
    validates_numericality_of :nb_notes, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_links, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_questions, :greater_than_or_equal_to => 0
    
    validates_numericality_of :nb_followers, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_followed_users, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_followed_topics, :greater_than_or_equal_to => 0
    
    validates_numericality_of :nb_liked_notes, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_liked_links, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_liked_questions, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_liked_documents, :greater_than_or_equal_to => 0
    
    validates_numericality_of :nb_thanks_received, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_thanks_sent, :greater_than_or_equal_to => 0
    
    validates_numericality_of :nb_upvotes_received, :greater_than_or_equal_to => 0
  end # class Stats
end # module Crowdbase