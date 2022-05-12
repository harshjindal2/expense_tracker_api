class EmployeesOnesController < ApplicationController

    ALLOWED_DATA = %[name email password password_confirmation].freeze

   def show_employees
       
       #@employees = EmployeeOne.all

       employee = EmployeeOne.find_by(id: params[:id])
         Current.employee = employee
        authorize employee, policy_class: EmployeePolicy
        @employees = EmployeeOne.all
        render :show_employees
       #render json: expenses
  
   end

   def get_employee

    @employee = EmployeeOne.find(params[:id])
    

   end

   

def create_employee

    data = json_payload.select {|k| ALLOWED_DATA.include?(k)}
    employee = EmployeeOne.new(data)

    if employee.save!
        render json: employee
    else
        render json:{"error": "could not create "}
    end

end

def update_employee
    #employee = EmployeeOne.find_by(id: params[:id])
    data = json_payload.select {|k| ALLOWED_DATA.include?(k)}
    if EmployeeOne.update(data)
      render json: "updated"
    else
        render json: "error"

    end
end


def delete_employee


    employee = EmployeeOne.find(params[:id])
    employee.destroy


end

end