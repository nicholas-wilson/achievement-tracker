class SessionsController < ApplicationController

  def index
    if current_user
      redirect_to user_path(current_user)
    end
  end

  def new
    if current_user
      redirect_to user_path(current_user)
    end
    # we let rails implicitly render our view for logging in
  end

  def create
    user = User.find_by(username: params[:username])
    authenticated = user.try(:authenticate, params[:password])
    if authenticated
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # Show validation errors here and redirect to login page
      redirect_to "/login"
    end
  end

  def destroy
    session.clear
    redirect_to '/login'
  end
end