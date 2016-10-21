class GoalsController < ApplicationController
  before_action :authenticate_user!
  def index
    @goals = current_user.goals.all
  end

  def show
    # if params[:step_id].present? == false
    #
    #   @goal = Goal.find(params[:goal_id])
    # else
    #   @step = Step.find(params[:id])
    # end
    @step = Step.find(params[:id])
    if @step != nil
      @step = Step.find(params[:id])
      @goal = @step.goal
      @steps = @goal.steps
    else
      @goal = Goal.find(params[:id])
      @steps = @goal.steps
    end
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
