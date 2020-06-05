class User < ApplicationRecord
  has_many :comments
  has_many :guides
  has_many :forums
  has_many :activities
  has_one_attached :cover

  has_secure_password

  validates :family_name, presence: true, uniqueness: true
  validates :discord_tag, presence: true, uniqueness: true
  validates :rank, presence: true
  validates :atack, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 330 }
  validates :atack_awake, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 332 }
  validates :denfense, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 550 }
  validates :gear_score, presence: true
  validates :branch, presence: true
  validates :avatar, presence: true
  validates :password, length:{ in: 6..20 }, unless: proc {|user| user.password.blank?}
  validates :description, presence: true, length:{ minimun: 1, maximum: 1400 }

  enum rank: {recruit: 0, member: 1, quarter_master: 2, oficcer: 3, guild_master: 4}
  enum branch: {awakening: 0, succession: 1}

  def is_admin?
    guild_master? || oficcer?
  end

  def rank_name
    rank.to_s.split("_").map(&:capitalize).join(" ")
  end
end
