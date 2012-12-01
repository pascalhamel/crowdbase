require Crowdbase.root.join("lib/crowdbase/db/data_model")
require Crowdbase.root.join("lib/crowdbase/db/stats")
require Crowdbase.root.join("lib/crowdbase/db/images")
require Crowdbase.root.join("lib/crowdbase/db/user")
require Crowdbase.root.join("lib/crowdbase/db/post")
require Crowdbase.root.join("lib/crowdbase/db/topic")
require Crowdbase.root.join("lib/crowdbase/db/question")
require Crowdbase.root.join("lib/crowdbase/db/note")
require Crowdbase.root.join("lib/crowdbase/db/section")
require Crowdbase.root.join("lib/crowdbase/db/link")

module Crowdbase
  module DB
    class << self
      def initialize!
      end # def initialize
    end # class << self
  end # DB
end # module Crowdbase