class User < ApplicationRecord
  has_many :events, through: :participants
  has_many :participants, dependent: :destroy
  has_many :sports, through: :user_sports
  has_many :user_sports, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :gender, presence: true
  validates :location, presence: true
end
