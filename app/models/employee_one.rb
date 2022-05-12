class EmployeeOne < ApplicationRecord

   has_many :expenses

    has_secure_password
end
