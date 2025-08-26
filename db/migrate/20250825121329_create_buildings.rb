class CreateBuildings < ActiveRecord::Migration[8.0]
  def change
    create_table :buildings do |t|
      t.string :building_name
      t.text :address
      t.string :location
      t.string :other_description
      t.boolean :register_status, default: false

      t.timestamps
    end
  end
end
