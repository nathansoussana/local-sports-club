class Event < ApplicationRecord
  include PgSearch::Model

  belongs_to :sport
  belongs_to :user
  has_many :participants, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true
  validates :address, presence: true
  validates :level, presence: true
  validates :participant_number, presence: true
  validates :duration, presence: true

  pg_search_scope :search, against: [:name, :address, :level],
    associated_against: {
      sport: [:name]
    },
    using:
    {
      tsearch: { prefix: true }
    }
end
