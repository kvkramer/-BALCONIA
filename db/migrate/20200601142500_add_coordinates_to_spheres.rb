class AddCoordinatesToSpheres < ActiveRecord::Migration[6.0]
  def change
    add_column :spheres, :latitude, :float
    add_column :spheres, :longitude, :float
  end
end
