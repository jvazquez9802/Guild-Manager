class Forum < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :category

  has_rich_text :content

  validates :title, presence: true
  validates :reason, presence: true
  validates :content, presence: true
end
