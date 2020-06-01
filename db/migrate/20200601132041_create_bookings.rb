class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :starttime
      t.time :endtime
      t.integer :booking_price

      t.timestamps
    end
  end
end
