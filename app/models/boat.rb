class Boat < ApplicationRecord
  has_attachment :photo
  has_many :bookings, dependent: :destroy
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, uniqueness: true, presence: true
  validates :organizer, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :address, presence: true
  validates :street_address, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :description, presence: true
  validates :objectives, presence: true
end
