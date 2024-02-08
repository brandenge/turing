class AddColumnToPetApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :pet_applications, :status, :integer, null: false, default: 0
  end
end
