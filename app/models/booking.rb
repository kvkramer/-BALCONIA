class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sphere
  has_one :review, dependent: :destroy
end
