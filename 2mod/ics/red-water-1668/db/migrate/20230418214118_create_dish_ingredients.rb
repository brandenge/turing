class CreateDishIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :dish_ingredients do |t|
      t.references :dish, foreign_key: true, null: false
      t.references :ingredient, foreign_key: true, null: false
    end
  end
end
