class Room < ApplicationRecord
  validates :name, :city, length: { maximum: 50 }
  validates :name, :city, :rate, :type, :amenities, :picture, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  belongs_to :reservation
  has_one_attached :picture
end
