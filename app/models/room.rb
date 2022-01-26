class Room < ApplicationRecord
  validates :name, :city, length: { maximum: 50 }
  validates :name, :city, :rate, :room_type, :amenities, :picture, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  has_many :reservations, dependent: :destroy
end
