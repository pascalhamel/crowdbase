module Crowdbase
  class User < DataModel
    
    attribute :first_name, String
    attribute :last_name, String
    attribute :job_title, String
    attribute :email, String
    attribute :post_email, String
    
    attribute :description, String
    attribute :bio, String
    
    attribute :created_at, Time
    attribute :updated_at, Time
    
    attribute :stats, Stats
    attribute :images, Images
    
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :job_description
    
    validates_format_of :email, :with => EMAIL_REGEXP
    validates_format_of :post_email, :with => EMAIL_REGEXP
    
    def initialize(*args)
      super
      self.job_title = args.try(:first).try(:[], :job_description)
      self.stats = Stats.new(args.try(:first))
      self.images = Images.new(args.try(:first))
    end # def initialize
    
    def name
      "#{self.first_name.try(:strip)} #{self.last_name.try(:strip)}".strip
    end # def name
    
    def valid?
      super
      if self.stats.kind_of? Stats
        self.errors.add(:stats) unless self.stats.valid?
      end # if we have a current title
      
      if self.images.kind_of? Images
        self.errors.add(:images) unless self.images.valid?  
      end # if we have a current badge
      self.errors.messages.keys.size.zero?
    end # def valid?
    
  end # class User
end # module Crowdbase