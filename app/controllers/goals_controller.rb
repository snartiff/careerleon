class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @goals = Goal.all
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path
      flash[:success] = "Hooray #{current_user.first_name}! You created a new career goal!"
    else
      @goal.errors.any?
      flash[:notice] =  @goal.errors.full_messages.join(", ")
      render :new
    end
  end

  protected

  def goal_params
    params.require(:goal).permit(:title, :description, :deadline)
  end
end
