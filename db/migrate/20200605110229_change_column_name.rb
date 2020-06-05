class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :spheres, :price, :cost_per_day
  end
end
