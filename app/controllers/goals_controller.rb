class GoalsController < ApplicationController
  def index
    # list them all for a specific user
  end

  def new
    redirect_if_not_logged_in
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.valid?
      @goal.save
      redirect_to goal_path(goal)
    else
      render :new
    end
  end

  def show      # if I want to keep this I should display the type of achievements people are setting.
    redirect_if_not_logged_in
    @goal = Goal.find_by(id: params[:id])
  end


  private

  def goal_params
    params.require(:goal).permit(:category)
  end
end