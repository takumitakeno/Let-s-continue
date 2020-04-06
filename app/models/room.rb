class Room < ApplicationRecord
  has_many :user_rooms, dependent: :destroy
  has_many :users, through: :user_rooms,dependent: :destroy
  has_many :chats, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
end
