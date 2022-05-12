class ExpensesController < ApplicationController

   # before_action :set_expense
  
    ALLOWED_DATA_TWO = %[invoice_number name amount group status].freeze


   def find_expense
     employee = EmployeeOne.find_by(id: params[:id])

     if !employee
       render json: "Employee Not Present"
     else
     @expenses  = employee.expenses
     end  
   end

   def show_expenses

    employee = EmployeeOne.find_by(id: params[:id])
        Current.employee = employee
        authorize employee,policy_class: EmployeePolicy
    @expenses = Expense.all
      
   end

   def new
       #expense = Expense.new
   end
   
   
     def create_expense
            employee = EmployeeOne.find_by(id: params[:id])
            # require 'byebug'
            # byebug
            # expense.employee = employee
            data = json_payload.select {|k| ALLOWED_DATA_TWO.include?(k)}
            @emp_expense = employee.expenses.new(data)
    if @emp_expense.save!
         render json: @emp_expense
    else
        render json:{"error": "could not create "}
    end
end
     

     def update_expenses
        employee = EmployeeOne.find_by(id: params[:id])
        Current.employee = employee
        authorize employee,policy_class: EmployeePolicy

        @expense = Expense.find_by(id: params[:ex_id])

        data = json_payload.select {|k| ALLOWED_DATA_TWO.include?(k)}

        # @expense = employee.expenses
        # require 'byebug'
        # byebug
       if @expense.update(data)

        render json: @expense
          if @expense.status == true
            @expense.update(status: true)
            @employee = @expense.employee_one
            StatusMailer.status_email(@expense,@employee).deliver_now
          else
            @expense.update(status: false)
            @employee = @expense.employee_one
            StatusMailer.status_email(@expense,@employee).deliver_now
          end
          
       else
        render json:{"error": "could not update "}
       end
     end
   
     def delete_expense

           expense = Expense.find(params[:id])
           expense.destroy
       
     end

     



     def check_invoice_number(expense)
       invoice_number = expense.invoice_number
       if invoice_number%2 == 0
           render plain: "Approved"
       else
           render plain: "Rejected"
       end
     end

    #  def set_expense
    #    @expense = Expense.find_by(id: params[:id])
    #  end

end