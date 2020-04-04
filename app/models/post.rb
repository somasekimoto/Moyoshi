class Post < ApplicationRecord
  acts_as_taggable
  acts_as_taggable_on :genres

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :content, presence: true, unless: :image?

  mount_uploader :image, ImageUploader

  geocoded_by :address

  attr_writer :prefecture, :city, :town

  before_validation :set_address

  def prefecture
    @prefecture || self.address.split(" ").first if self.address.present?
  end

  def city
    @city || self.address.split(" ").second if self.address.present?
  end

  def town
    @town || self.address.split(" ").last if self.address.present?
  end

  def set_address
    self.address = [@prefecture, @city, @town].join(" ")
  end


  after_validation :geocode, if: Proc.new { |a| a.address_changed? }
  
  def thumbnail
    return self.image.variant(resize: '50x50')
  end

  @post_genres = Post.all.includes(:user).order('created_at DESC').tagged_with(:tag)
end
