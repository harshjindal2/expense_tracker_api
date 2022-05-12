Rails.application.routes.draw do

  resources :books
  resources :employees_ones
  resources :expenses

  namespace :api do
     
      resources :employees_ones, defaults: {format: :json}
      resources :expenses, defaults: {format: :json}

  end

  post "create_employee", to: "employees_ones#create_employee"
  get "show_employees", to: "employees_ones#show_employees"

  get "get_employee" ,to: "employees_ones#get_employee"
  patch "update_employee", to: "employees_ones#update_employee"
  delete "delete_employee", to: "employees_ones#delete_employee"

  post "create_expense", to: "expenses#create_expense"

  get "find_expense" , to: "expenses#find_expense"
  get "show_expenses", to: "expenses#show_expenses"

  patch "update_expenses", to: "expenses#update_expenses"

  delete "delete_expense", to: "expenses#delete_expense"

  post "expense_status", to: "expenses#expense_status"

  post "create_comment", to: "comments#create_comment"
  delete "delete_comment", to: "comments#delete_comment"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
