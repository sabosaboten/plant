class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, presence: true, uniqueness: true

  has_many :schedules
  has_many :posts
  has_many :comments
  has_many :liked_posts, through: :likes, source: :post
  has_many :likes, dependent: :destroy

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

end
