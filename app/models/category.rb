class Category < ApplicationRecord
  has_many :forums
  has_many :guides

  validates :name, presence: true
end
