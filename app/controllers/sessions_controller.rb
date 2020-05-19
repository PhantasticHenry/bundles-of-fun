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

    def omni
        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.uid = auth['uid']
            u.name = auth['info']['name']
            u.password = SecureRandom.alphanumeric(10)
        end   
          session[:user_id] = @user.id
          redirect_to root_path
    end

    def destroy 
        session.clear 
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end