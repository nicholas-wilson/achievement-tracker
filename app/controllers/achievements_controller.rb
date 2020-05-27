class AchievementsController < ApplicationController

  def index

  end

  def new
    redirect_if_not_logged_in
    @achievement = Achievement.new
  end

  def create

  end

  def show

  end

  private

  def redirect_if_not_logged_in
    if !current_user
      redirect_to '/login'
    end
  end

end