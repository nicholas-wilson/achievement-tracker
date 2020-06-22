class AchievementsController < ApplicationController
  before_action :current_user
  before_action :current_achievement, only: [:show, :edit, :update]
  
  def index
    @achievements = @user.achievements
  end

  def new
    redirect_if_not_logged_in
    @achievement = Achievement.new
    @achievement.user_id = @user.id
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to user_achievement_path(@user, @achievement)
    else
      render :new
    end
  end

  def show
    redirect_if_not_belonging_to_current_user(@achievement)
  end

  def edit
    redirect_if_not_belonging_to_current_user(@achievement)
  end

  def  update
    if @achievement.update(achievement_params)
      redirect_to user_achievement_path(@user, @achievement)
    else
      render :edit
    end
  end

  private

  def achievement_params
    params.require(:achievement).permit(:title, :description, :value, :completed, :user_id, :goal_id)
  end

  def current_achievement
    @achievement = Achievement.find_by(id: params[:id])
  end

  def redirect_if_not_belonging_to_current_user(achievement)
    if !achievement || current_user.id != achievement.user_id
      redirect_to user_achievements_path(current_user) # We want to redirect users to their achievements index page once it's in the code.
    end
  end
end