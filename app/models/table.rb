class Table < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :items
  has_one :channel
end
