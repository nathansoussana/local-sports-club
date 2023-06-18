class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_many :participants, dependent: :destroy

  validates :name, presence: true
  validates :date, presence: true
  validates :address, presence: true
  validates :level, presence: true
  validates :participant_number, presence: true
  validates :duration, presence: true
end
