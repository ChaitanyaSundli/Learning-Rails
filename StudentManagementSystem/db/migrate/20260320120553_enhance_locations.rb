class EnhanceLocations < ActiveRecord::Migration[8.1]
  def change
    add_column :locations, :building, :string
    add_column :locations, :floor, :string
    add_column :locations, :location_type, :string
  end
end