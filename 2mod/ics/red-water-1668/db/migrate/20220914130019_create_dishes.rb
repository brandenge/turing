class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :chef, foreign_key: true, null: false

      t.timestamps
    end
  end
end
