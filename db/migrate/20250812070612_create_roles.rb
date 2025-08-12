class CreateRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :roles do |t|
      t.string :name, default: 'user', null: false

      t.timestamps
    end
  end
end
