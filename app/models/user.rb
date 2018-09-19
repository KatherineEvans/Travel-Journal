class User < ApplicationRecord
  has_many :posts
  has_many :trips
  has_many :likes
  has_many :comments
end
