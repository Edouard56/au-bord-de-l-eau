class Boat < ApplicationRecord

  has_many :bookings, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :nb_of_passengers, presence: true
end
