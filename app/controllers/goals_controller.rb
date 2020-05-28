class GoalsController < ApplicationController
  def index
    # list them all for a specific user
  end

  def new
    redirect_if_not_logged_in
    @goal = Goal.new
  end

  def create
    if goal = Goal.create(goal_params)
      redirect_to goal_path(goal)
    else
      redirect_to new_goal_path # don't forget to add errors
    end
  end

  def show
    redirect_if_not_logged_in
    @goal = Goal.find_by(id: params[:id])
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def goal_params
    params.require(:goal).permit(:category)
  end
end