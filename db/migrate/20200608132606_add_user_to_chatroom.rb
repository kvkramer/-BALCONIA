class AddUserToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :user
  end
end
