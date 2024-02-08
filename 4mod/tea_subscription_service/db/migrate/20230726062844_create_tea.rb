class CreateTea < ActiveRecord::Migration[7.0]
  def change
    create_table :teas do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.integer :temperature, null: false
      t.integer :brew_time, null: false

      t.timestamps
    end
  end
end
