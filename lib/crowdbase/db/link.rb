module Crowdbase
  class Link < DataModel
    
    attribute :title, String
    attribute :url, String
    attribute :description, String
    
    attribute :created_at, Time
    attribute :updated_at, Time
    attribute :excerpt, String
    
    attribute :owner_id, String
    attribute :section_id, String
    
    attribute :topic_ids, Array
    
    attribute :viewed_by_user, Object
    attribute :starred_by_user, Object
    attribute :liked_by_user, Object
    
    attribute :is_featured, Object
    
    attribute :comments_count, Integer, :default => 0
    attribute :likers_count, Integer, :default => 0
    attribute :views_count, Integer, :default => 0
    
    validates_presence_of :title
    validates_format_of :url, :with => URL_REGEXP
    
    validates_presence_of :owner_id
    validates_presence_of :section_id
    
    validates_type_of :topic_ids, :as => Array
    validates_elements_of :topic_ids, :as => String
    
    validates_type_of :viewed_by_user, :in => [TrueClass, FalseClass]
    validates_type_of :starred_by_user, :in => [TrueClass, FalseClass]
    validates_type_of :liked_by_user, :in => [TrueClass, FalseClass]
    
    validates_type_of :is_featured, :in => [TrueClass, FalseClass]
    
    validates_numericality_of :comments_count, :greater_than_or_equal_to => 0
    validates_numericality_of :likers_count, :greater_than_or_equal_to => 0
    validates_numericality_of :views_count, :greater_than_or_equal_to => 0
    
    def initialize(*args)
      super
      self.type = "Crowdbase::Link"
      user_info = args.try(:first).try(:[], :user)
      self.owner_id = user_info.try(:[], "id")
      
      link_topics = args.try(:first).try(:[], :topics)
      unless link_topics.blank?
        self.topic_ids ||= []
        link_topics.each do |topic|
          self.topic_ids << topic["id"] unless topic["id"].blank?
        end
      end # save topics in topic_ids
      
      section_info = args.try(:first).try(:[], :section)
      self.section_id = section_info.try(:[], "id")
    end # def initialize
    
  end # class Link
end # module Crowdbase