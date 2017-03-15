class Boat < ApplicationRecord
  has_attachment :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  validates :nb_of_passengers, presence: true
end
