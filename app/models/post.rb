class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :image, presence: true
  validates :text, presence: true

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  mount_uploader :image, ImageUploader
end
