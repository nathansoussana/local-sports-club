class Sport < ApplicationRecord
  include PgSearch::Model

  has_many :user_sports, dependent: :destroy
  has_many :users, through: :user_sports
  has_many :events

  validates :name, presence: true
  validates :icon, presence: true

  pg_search_scope :search, against: [:name],
    using: {
      tsearch: { prefix: true }
    }
end
