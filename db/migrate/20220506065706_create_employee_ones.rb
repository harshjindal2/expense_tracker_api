class CreateEmployeeOnes < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_ones do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin

      t.timestamps
    end
  end
end
