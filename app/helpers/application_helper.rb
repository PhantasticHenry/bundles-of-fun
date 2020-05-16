module ApplicationHelper
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in? 
        !!current_user
    end


    def authorized
        current_user == @product.user
     end
end
