class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable

  validates :name, presence: true, length: { maximum: 100 }

  has_many :reservations, dependent: :destroy
  has_many :rooms, dependent: :destroy
end
