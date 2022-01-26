class Reservation < ApplicationRecord
  validates :check_in, :check_out, presence: true

  belongs_to :user
  belongs_to :room
end
