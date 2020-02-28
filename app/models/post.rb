class Post < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
