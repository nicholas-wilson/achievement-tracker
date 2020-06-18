class UsersController < ApplicationController
  
  def new
    if !current_user
      @user = User.new
    else
      flash.alert = "You are already logged in."
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else 
      flash.alert = "Must provide a Username when creating an account"
      redirect_to new_user_path
    end
  end

  def show
    if current_user.id == session[:user_id]
      @user = current_user
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end