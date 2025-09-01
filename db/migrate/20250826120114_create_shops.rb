class CreateShops < ActiveRecord::Migration[8.0]
  def change
    create_table :shops do |t|
      t.string :stall_name
      t.string :stall_addres
      t.string :stall_pincode
      t.string :stall_city
      t.string :stall_state
      t.text :stall_details
      t.string :stall_link
      t.boolean :stall_registraton_status, default: false
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
