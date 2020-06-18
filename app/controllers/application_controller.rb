class ApplicationController < ActionController::Base
  helper_method :current_user, :redirect_if_not_logged_in

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def redirect_if_not_logged_in
    if !current_user
      redirect_to '/login'
    end
  end
end
