class Channel < ApplicationRecord
  include ActiveModel::ForbiddenAttributesProtection
  has_many :messages, dependent: :destroy
  belongs_to :table, optional: true
end
