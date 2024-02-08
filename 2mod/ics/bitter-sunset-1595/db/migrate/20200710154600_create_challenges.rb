class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.string :theme
      t.integer :project_budget

      t.timestamps
    end
  end
end
