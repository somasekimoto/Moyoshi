class Post < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres

  belongs_to :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
