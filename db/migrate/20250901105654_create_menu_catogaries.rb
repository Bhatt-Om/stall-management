class CreateMenuCatogaries < ActiveRecord::Migration[8.0]
  def change
    create_table :menu_catogaries do |t|
      t.string :name, null: false
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
