class CreateSpheres < ActiveRecord::Migration[6.0]
  def change
    create_table :spheres do |t|
      t.text :address
      t.text :description
      t.integer :price
      t.boolean :barbecue

      t.timestamps
    end
  end
end
