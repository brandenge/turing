class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :subject, null: false
      t.integer :age, null: false

      t.timestamps
    end
  end
end
