class Conversation < ApplicationRecord
  belongs_to :sphere
  belongs_to :user
end
