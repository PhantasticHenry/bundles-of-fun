class UsersController < ApplicationController
    def new 
        @user = User.new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id 
            redirect_to root_path
        else 
            render :new
        end
    end

    def edit 

    end

    def update

    end

    private 
    def user_params 
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user 
        @user = User.find_by(id: params[:id])
    end
end
