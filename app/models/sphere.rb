class Sphere < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :title, presence: true, length: { minimum:4 }
  validates :address, presence: true, length: { minimum:1 }

  validates :cost_per_day, presence: true
  validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
