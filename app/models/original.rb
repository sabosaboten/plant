class Original < ApplicationRecord
  belongs_to :user
  has_many :event_originals
  has_many :events, through: :event_originals
end
