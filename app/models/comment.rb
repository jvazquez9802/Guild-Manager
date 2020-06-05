class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :guide, optional: true
  belongs_to :forum, optional: true

  validates :content, presence: true

  serialize :dislikes, Array
  serialize :likes, Array
end
