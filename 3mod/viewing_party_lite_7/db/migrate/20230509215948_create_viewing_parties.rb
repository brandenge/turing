class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.timestamp :start_time
      t.integer :movie_id

      t.timestamps
    end
  end
end
