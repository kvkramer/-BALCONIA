class Chatroom < ApplicationRecord
  belongs_to :sphere
  belongs_to :user
  has_many :messages
end
