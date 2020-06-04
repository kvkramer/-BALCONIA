class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :sphere
  has_many :reviews, dependent: :destroy
end
