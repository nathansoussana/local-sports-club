class Event < ApplicationRecord
  belongs_to :sport
  belongs_to :user
  has_many :participants, dependent: :destroy
end
