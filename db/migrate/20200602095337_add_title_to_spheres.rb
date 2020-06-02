class AddTitleToSpheres < ActiveRecord::Migration[6.0]
  def change
    add_column :spheres, :title, :string
  end
end
