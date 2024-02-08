class CreateContestantProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :contestant_projects do |t|
      t.references :contestant, foreign_key: true
      t.references :project, foreign_key: true
    end
  end
end
