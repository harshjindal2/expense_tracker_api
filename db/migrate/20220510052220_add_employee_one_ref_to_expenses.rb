class AddEmployeeOneRefToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_reference :expenses, :employee_one,  foreign_key: true
  end
end
