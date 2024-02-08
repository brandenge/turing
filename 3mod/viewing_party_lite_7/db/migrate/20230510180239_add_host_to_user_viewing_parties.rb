class AddHostToUserViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :user_viewing_parties, :user_type, :integer, null: false, default: 0
  end
end
