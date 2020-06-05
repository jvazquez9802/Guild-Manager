class Guide < ApplicationRecord
  has_many :comments
  has_rich_text :content

  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
end
