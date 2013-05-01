class User < ActiveRecord::Base
  acts_as_tagger
end

class Location < ActiveRecord::Base
  acts_as_taggable_dynamic
end