class Channel < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_many :messages
  belongs_to :table
end
