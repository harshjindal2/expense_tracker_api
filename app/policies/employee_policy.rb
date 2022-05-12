class EmployeePolicy < ApplicationPolicy

    def expense_status?
        employee.is_admin?
    end

    def create_comment?
        employee.is_admin?
    end

    def index_employee?
        employee.is_admin?
    end

    def delete_employee?
        employee.is_admin?
    end

    def expense_group_status?
        employee.is_admin?
    end

    def delete_comment?
        employee.is_admin?
    end

    def show_employees?
        employee.is_admin?
    end

    def show_expenses?
        employee.is_admin?
    end

    def update_expenses?
        employee.is_admin?
    end

    def delete_expense?
        employee.is_admin?
    end

    def create_comment?
        employee.is_admin?
    end
end