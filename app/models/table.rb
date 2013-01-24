class Table < ActiveRecord::Base
  attr_accessible :name
  has_many :items
  has_one :channel
end
