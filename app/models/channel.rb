class Channel < ActiveRecord::Base
  attr_accessible :name
  has_many :messages
  belongs_to :table
end
