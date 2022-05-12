class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.integer :invoice_number
      t.string :name
      t.integer :amount
      t.string :group

      t.timestamps
    end
  end
end
