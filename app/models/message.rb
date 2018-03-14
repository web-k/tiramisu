class Message < ApplicationRecord
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :channel
end
