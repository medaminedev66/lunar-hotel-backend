class Reservation < ApplicationRecord
  validates :nights, :check_in, :check_out, presence: true
  validates :nights, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user
  belongs_to :room
end
