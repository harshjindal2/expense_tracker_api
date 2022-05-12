class Expense < ApplicationRecord

     belongs_to :employee_one

     has_many :comments

  validates :invoice_number ,presence: true
  validates :name ,presence: true
  validates :amount ,presence: true
  validates :group ,presence: true

end
