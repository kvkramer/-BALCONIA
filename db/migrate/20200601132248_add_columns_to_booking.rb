class AddColumnsToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :string
    add_reference :bookings, :user, null: false, foreign_key: true
    add_reference :bookings, :sphere, null: false, foreign_key: true
  end
end
