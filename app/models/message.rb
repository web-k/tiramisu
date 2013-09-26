class Message < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  belongs_to :channel
end
