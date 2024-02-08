class CreaateContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.string :name
      t.integer :age
      t.string :hometown
      t.integer :years_of_experience

      t.timestamps
    end
  end
end
