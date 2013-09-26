class Item < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :table
end
