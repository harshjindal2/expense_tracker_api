class CommentMailer < ApplicationMailer
    default from: 'harshmain@gmail.com'

    def comment_email(expense,employee,comment)

        @expense = expense
        @employee = employee
        @comment = comment
        mail(to: @employee.email, subject: 'Comment regarding your expense' )

    end

end
