class Like < ApplicationRecord

  validates :post_id, presence: true
  validates :value, presence: true

  belongs_to :user
  belongs_to :post
end
