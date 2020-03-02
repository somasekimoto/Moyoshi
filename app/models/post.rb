class Post < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
  
  def thumbnail
    return self.image.variant(resize: '50x50')
  end

  @post_genres = Post.all.includes(:user).order('created_at DESC').tagged_with(:tag)
end
