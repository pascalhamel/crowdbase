module Crowdbase
  module Version
    MAJOR = 0
    MINOR = 1
    PATCH = 0

    class << self
      def number
        "#{self::MAJOR}.#{self::MINOR}.#{self::PATCH}"
      end # def number
    end # def clas << self
    
  end # def module Version
end # def module YEL::Version