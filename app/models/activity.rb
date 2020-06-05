class Activity < ApplicationRecord
  belongs_to :user

  has_rich_text :content
  has_one_attached :avatar

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :channel, presence: true
  validates :start_time, presence: true
  validates :content, presence: true

  enum category: {pvp: 0, pve: 1, ls: 2}

  serialize :participants, Array
end
