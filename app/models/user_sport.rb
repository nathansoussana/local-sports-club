class UserSport < ApplicationRecord
  belongs_to :sport
  belongs_to :user

  #validates :level, presence: true
end
