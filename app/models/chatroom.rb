class Chatroom < ApplicationRecord
  belongs_to :event
  has_many :massages, dependent: :destroy
end
