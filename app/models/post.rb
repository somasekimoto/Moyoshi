class Post < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  # def self.search(search)
  #   if search
  #     keywords = search.split(/[[:blank:]]+/).select(&:present?)
  #     negative_keywords, positive_keywords =
  #     keywords.partition {|keyword| keyword.start_with?("-") }

  #     @posts = Post

  #     positive_keywords.each do |keyword|
  #       @posts = @posts.where("title LIKE ?", "%#{keyword}%")
  #     end

  #     negative_keywords.each {|word| word.slice!(/^-/) }

  #     negative_keywords.each do |keyword|
  #       next if keyword.blank?
  #       @posts = @posts.where.not("title LIKE ?", "%#{keyword}%")
  #     end
  #     Post.where('title LIKE(?) OR content LIKE(?)', "%#{search}%", "%#{search}%")
  #   else
  #     if params[:tag]
  #       @posts = Post.all.includes(:user).order('created_at DESC').tagged_with(params[:tag])
  #     else
  #       @posts = Post.all.includes(:user).order('created_at DESC')
  #     end
  #   end
  # end
end
