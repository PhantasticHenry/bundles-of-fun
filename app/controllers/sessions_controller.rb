class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, :only => :create
    
    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to root_path
        else
            redirect_to login_path, alert: "User not found. Please try again."
        end
    end

    def destroy 
        session.clear 
        redirect_to root_path
    end
end