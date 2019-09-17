class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :body, presence: true, length: { maximum: 280 }
end
