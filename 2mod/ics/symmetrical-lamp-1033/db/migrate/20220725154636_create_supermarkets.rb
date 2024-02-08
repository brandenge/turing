class CreateSupermarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :supermarkets do |t|
      t.string :name
      t.string :location

      t.timestamps
    end
  end
end
