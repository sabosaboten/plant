class Event < ApplicationRecord
  belongs_to :user
  has_many :event_originals
  has_many :originals, through: :event_originals
end
