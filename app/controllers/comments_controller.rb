class CommentsController < ApplicationController

    ALLOWED_DATA = %[description reply].freeze

    def create_comment

        employee = EmployeeOne.find_by(id: params[:id])
        Current.employee = employee
        authorize employee,policy_class: EmployeePolicy
        @current_employee = EmployeeOne.find_by(id: params[:emp_id])
        @expense = @current_employee.expenses.find_by(id: params[:ex_id])
        data = json_payload.select { |instance| ALLOWED_DATA.include? instance}
        @comment = @expense.comments.new(data)
        
        if @comment.save
            CommentMailer.comment_email(@expense,@current_employee,@comment).deliver_now
            render json: @comment
        else
            render json: "error" 
        end

    end

    def delete_comment
 
        employee = EmployeeOne.find_by(id: params[:id])
        Current.employee = employee
        authorize employee,policy_class: EmployeePolicy
        current_employee = EmployeeOne.find_by(id: params[:emp_id])
        expense = current_employee.expenses.find_by(id: params[:ex_id])
        comment = expense.comments.find_by(id: params[:c_id])
        del_com = comment
        if (comment.destroy)
            render json: del_com 
        else
            render json: "error"
        end


    end

    def update_comment
        comment = Comment.find_by(id: params[:id])
        data = json_payload.select { |instance| ALLOWED_DATA.include? instance}
        if comment.update(data)
            render json: "Comment modified"
        else
            render json: "Error"
        end
    end

end