class Trip < ApplicationRecord
  
  validates :location, presence: true

  belongs_to :user
  has_many :posts
end
