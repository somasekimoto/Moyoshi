class Post < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search
      Post.where('title LIKE(?)', 'content LIKE(?)', "%#{search}%", "%#{search}%")
    else
      if params[:tag]
        @posts = Post.all.includes(:user).order('created_at DESC').tagged_with(params[:tag])
      else
        @posts = Post.all.includes(:user).order('created_at DESC')
      end
    end
  end
end
