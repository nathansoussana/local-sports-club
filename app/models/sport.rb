class Sport < ApplicationRecord
  has_many :user_sports, dependent: :destroy
  has_many :users, through: :user_sports
  has_many :events

  validates :name, presence: true
  validates :image, presence: true
end
