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
    @town || self.address.split(" ").third if self.address.present?
  end

  def set_address
    self.address = [@prefecture, @city, @town].join(" ")
  end


  after_validation :geocode, if: Proc.new { |a| a.address_changed? }

  class << self
    def within_box(distance, latitude, longitude)
      distance = distance
      center_point = [latitude, longitude]
      box = Geocoder::Calculations.bounding_box(center_point, distance)
      self.within_bounding_box(box)
    end



    
    def search(word)
      keywords = word.split(/[[:blank:]]+/).select(&:present?)
      negative_keywords, positive_keywords =
      keywords.partition {|keyword| keyword.start_with?("-") }

      posts = Post

      positive_keywords.each do |keyword|
        posts = posts.where("title LIKE ? OR content LIKE ?", "%#{keyword}%", "%#{keyword}%").order('created_at DESC')
      end

      negative_keywords.each {|word| word.slice!(/^-/) }

      negative_keywords.each do |keyword|
        next if keyword.blank?
        posts = posts.where.not("title LIKE ? OR content LIKE ?", "%#{keyword}%", "%#{keyword}%").order('created_at DESC')
      end
      return posts
    end
  end
end
