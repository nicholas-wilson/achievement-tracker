class AchievementsController < ApplicationController

  def index
    # Only nested route for users/:id/achievements
    # To be implemented
  end

  def new
    redirect_if_not_logged_in
    @achievement = Achievement.new
  end

  def create
    # validations to be made at a later time <------- don't forget
    achievement = Achievement.new(achievement_params)
    achievement.user_id = current_user.id
    
    if achievement.save
      redirect_to achievement_path(achievement)
    else
      # Tell the user the problem with the data they gave you.
      redirect_to new_achievement_path
    end
  end

  def show
    @achievement = current_achievement
    redirect_if_not_belonging_to_current_user(@achievement)
  end

  def edit
    @achievement = current_achievement
    @user = current_user
    redirect_if_not_belonging_to_current_user(@achievement)
  end

  def  update
    # add validations
    achievement = current_achievement
    achievement.update(achievement_params)
    redirect_to acvhievement_path(achievement)
  end

  def destroy
    
  end

  private

  def achievement_params
    params.require(:achievement).permit(:title, :description, :value, :completed)
  end

  def redirect_if_not_logged_in
    if !current_user
      redirect_to '/login'
    end
  end

  def current_achievement
    Achievement.find_by(id: params[:id])
  end

  def redirect_if_not_belonging_to_current_user(achievement)
    if current_user.id != achievement.user_id
      redirect_to user_path(current_user) # We want to redirect users to their achievements index page once it's in the code.
    end
  end

end