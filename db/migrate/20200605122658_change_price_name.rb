class ChangePriceName < ActiveRecord::Migration[6.0]
  def change
    rename_column :bookings, :price, :cost_per_day
  end
end
