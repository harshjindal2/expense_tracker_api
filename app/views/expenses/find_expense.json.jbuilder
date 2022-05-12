

#json.(@expenses,:id, :name , :amount, :group)
#json.(@expense ,:id ,:name ,:amount ,:group ,:employee_one_id ,:status)

json.array! @expenses do |expense|
    json.id expense.id
    json.name expense.name
    json.amount expense.amount
    json.group expense.group
    json.employee_id expense.employee_one_id
    json.status expense.status
    json.created_at expense.created_at
  end