class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Post.all unless search
    Post.where(['content LIKE(?) OR title LIKE(?)', "%#{search}%", "%#{search}%"])
  end
end
