class SessionsController < ApplicationController

  def index # home page
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
    if facebook_login?(auth_params)
      user = User.find_or_create_facebook_account(auth_params)
      authenticated = true
    else
      user = User.find_by(username: params[:username])
      authenticated = user.try(:authenticate, params[:password])
    end
    if authenticated
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.alert = "Wrong username/password combination, make sure not to leave either field blank."
      redirect_to "/login"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  private

  def facebook_login?(params)
    if params
      true
    else
      false
    end
  end

  def auth_params
    request.env['omniauth.auth'] ||= nil
  end
end