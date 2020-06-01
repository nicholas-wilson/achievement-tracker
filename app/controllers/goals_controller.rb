class GoalsController < ApplicationController
  def index
    # list them all for a specific user
  end

  def new
    redirect_if_not_logged_in
    @goal = Goal.new
    @user = current_user
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid?
      @goal.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:category)
  end
end