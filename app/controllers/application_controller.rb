class ApplicationController < ActionController::API

   include Pundit

   def current_user
      current_user = Current.employee
  end

#   def is_admin
#    is_admin = Current.employee.is_admin
# end

     def json_payload
        HashWithIndifferentAccess.new(JSON.parse(request.raw_post))
     end

     rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

     private

  def user_not_authorized
     render json: "Not authorized"
   #  flash[:alert] = "You are not authorized to perform this action."
    #redirect_to(request.referrer || root_path)
  end



end
