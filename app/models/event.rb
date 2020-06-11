class Event < ApplicationRecord
  belongs_to :user
  # has_many :event_originals
  # has_many :originals, through: :event_originals
  belongs_to :original

  validates :date, presence: true

end
