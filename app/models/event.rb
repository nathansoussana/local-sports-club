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

def search
  @events = Event.search(params[:search])
  respond_to do |format|
    format.js
  end
end

def self.search(search_params)
  events = all

  if search_params.present?
    events = events.where(city: search_params[:city]) if search_params[:city].present?
    events = events.where(sport: search_params[:sport]) if search_params[:sport].present?
    events = events.where(level: search_params[:level]) if search_params[:level].present?
  end

  events
end
