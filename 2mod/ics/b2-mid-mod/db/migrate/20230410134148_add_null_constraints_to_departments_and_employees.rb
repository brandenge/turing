class AddNullConstraintsToDepartmentsAndEmployees < ActiveRecord::Migration[5.2]
  def change
    change_column_null :departments, :name, false
    change_column_null :departments, :floor, false
    change_column_null :employees, :name, false
    change_column_null :employees, :level, false
    change_column_null :employees, :department_id, false
  end
end
