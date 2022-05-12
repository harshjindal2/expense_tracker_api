class ChangesToTables < ActiveRecord::Migration[6.1]
  def change
    add_column :employee_ones ,:is_active ,:boolean
    add_column :expenses ,:status ,:boolean
  end
end
