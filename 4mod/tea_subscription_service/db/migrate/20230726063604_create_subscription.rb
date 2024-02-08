class CreateSubscription < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :tea, null: false, foreign_key: true

      t.string :title, null: false
      t.integer :price, null: false
      t.integer :status, null: false, default: 0
      t.integer :frequency, null: false

      t.timestamps
    end
  end
end
