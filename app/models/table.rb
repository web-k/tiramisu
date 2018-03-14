class Table < ApplicationRecord
  include ActiveModel::ForbiddenAttributesProtection
  has_many :items, dependent: :destroy
  has_one :channel, dependent: :destroy
end
