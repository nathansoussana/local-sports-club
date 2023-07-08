class Event < ApplicationRecord
  include PgSearch::Model

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :sport
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true
  validates :address, presence: true
  validates :level, presence: true
  validates :participant_number, presence: true
  validates :duration, presence: true

  before_create :create_chatroom

  pg_search_scope :search, against: [:name, :address, :level],
    associated_against: {
      sport: [:name]
    },
    using:
    {
      tsearch: { prefix: true }
    }

  private

  def create_chatroom
    build_chatroom
  end

end
