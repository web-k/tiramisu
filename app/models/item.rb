class Item < ApplicationRecord
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :table
end
