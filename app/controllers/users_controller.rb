class UsersController < ApplicationController
  
  def new
    if !current_user
      @user = User.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
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