module Crowdbase
  class Stats < DataModel
    attribute :nb_notes, Integer, :default => 0
    attribute :nb_links, Integer, :default => 0
    attribute :nb_questions, Integer, :default => 0
    
    attribute :nb_followers, Integer, :default => 0
    attribute :nb_followed_users, Integer, :default => 0
    attribute :nb_followed_topics, Integer, :default => 0
    
    attribute :nb_liked_notes, Integer, :default => 0
    attribute :nb_liked_links, Integer, :default => 0
    attribute :nb_liked_questions, Integer, :default => 0
    attribute :nb_liked_documents, Integer, :default => 0
    
    attribute :nb_thanks_received, Integer, :default => 0
    attribute :nb_thanks_sent, Integer, :default => 0
    
    attribute :nb_upvotes_received, Integer, :default => 0
    attribute :nb_upvotes_sent, Integer, :default => 0
    attribute :nb_downvotes_received, Integer, :default => 0
    attribute :nb_downvotes_sent, Integer, :default => 0
    
    attribute :nb_views, Integer, :default => 0
    attribute :nb_volunteered_topics, Integer, :default => 0
    
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
    validates_numericality_of :nb_upvotes_sent, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_downvotes_received, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_downvotes_sent, :greater_than_or_equal_to => 0
    
    validates_numericality_of :nb_views, :greater_than_or_equal_to => 0
    validates_numericality_of :nb_volunteered_topics, :greater_than_or_equal_to => 0
    
    def initialize(*args)
      super
      self.nb_volunteered_topics = args.first[:nb_volonteered_topics]
    end # def initialize
  end # class Stats
end # module Crowdbase