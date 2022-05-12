json.extract! @employee, :id, :name, :email

json.expenses(@employee.expenses) do |expense|
    json.id expense.id
    json.name expense.name
    json.amount expense.amount
    json.group expense.group
    json.status expense.status
end