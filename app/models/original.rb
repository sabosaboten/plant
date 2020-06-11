class Original < ApplicationRecord
  belongs_to :user
  # has_many :event_originals
  # has_many :events, through: :event_originals
  has_many :events, dependent: :destroy

  validates :image, presence: true
  validates :plantname, presence: true

  mount_uploader :image, ImageUploader
end
