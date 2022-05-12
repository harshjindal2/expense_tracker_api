# json.array! @employees do |employee|
#     json.id employee.id
#     json.name employee.title
#     json.created_at employee.created_at
#   end




#json.(@employee ,  :name ,:email)


json.extract! @employees

json.array! @employees do |employee|
    json.id employee.id
    json.name employee.name
    json.email employee.email

    json.expenses(employee.expenses) do |expense|
        json.id expense.id
        json.name expense.name
        json.amount expense.amount
        json.group expense.group
        json.status expense.status
        
           json.comments(expense.comments) do |comment|
              json.id comment.id
              json.comment comment.description
           end
    end

  end