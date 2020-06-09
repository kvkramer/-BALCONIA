class Sphere < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates :title, presence: true, length: { minimum:4 }
  validates :address, presence: true, length: { minimum:1 }

  validates :cost_per_day, presence: true
  # validates :photos, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end

  # def freinds?(user_id)
  #   friends = Follow.find_by(follower_id: id, following_id: user_id)
  #   return true if friends
  # end
end
