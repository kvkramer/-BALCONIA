class AddColumnsToSpheres < ActiveRecord::Migration[6.0]
  def change
    add_column :spheres, :balcony, :boolean
    add_column :spheres, :garden, :boolean
    add_column :spheres, :terrace, :boolean
    add_column :spheres, :plants, :boolean
    add_column :spheres, :quiet, :boolean
    add_column :spheres, :sunny, :boolean
    add_column :spheres, :spacious_desk, :boolean
    add_column :spheres, :highspeed_wifi, :boolean
    add_column :spheres, :pet_friendly, :boolean
    add_column :spheres, :cozy, :boolean
  end
end
