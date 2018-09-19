class Post < ApplicationRecord

  validates :photo, presence: true
  validates :location, presence: true
  validates :trip_id, presence: true

  belongs_to :user
  belongs_to :trip
  has_many :comments
  has_many :likes
end
