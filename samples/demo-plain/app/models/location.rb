class Location < ActiveRecord::Base
  attr_accessible :name

  acts_as_taggable_dynamic
end
