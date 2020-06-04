class Sphere < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :title, presence: true, length: { minimum:4 }
  validates :address, presence: true, length: { minimum:1 }
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
