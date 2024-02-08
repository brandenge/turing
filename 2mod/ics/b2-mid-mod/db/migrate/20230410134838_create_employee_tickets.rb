class CreateEmployeeTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_tickets do |t|
      t.references :employee, foreign_key: true, null: false
      t.references :ticket, foreign_key: true, null: false

      t.timestamps
    end
  end
end
