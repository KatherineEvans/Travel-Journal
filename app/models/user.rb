class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :user_photo, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i

  has_many :posts
  has_many :trips
  has_many :likes
  has_many :comments
end
