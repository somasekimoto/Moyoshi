class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :text, presence: { message: "コメントを入力してください"}
end
