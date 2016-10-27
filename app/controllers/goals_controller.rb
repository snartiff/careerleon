class GoalsController < ApplicationController
  before_action :authenticate_user!
  def index
    @goals = current_user.goals.all
  end

  def show
    @goal = Goal.find(params[:id])
    @steps = @goal.steps
    # if Step.exists? == false
    #   @goal = Goal.find(params[:id])
    # end
    # if params[:id].present? && Step.exists? == true
    #   @goal = Step.find(params[:id]).goal
    #   @steps = @goal.steps
    # elsif params[:id] == nil && Step.exists? == true
    #   @goal = Step.find(params[:id]).goal
    #   @step = Step.new
    #   @steps = @goal.steps
    # elsif Step.exists? == false
    #   @goal = Goal.find(params[:id])
    # else
    #   @step = Step.find(params[:id])
    # end
    # if params[:id] == nil
    #   @step = Step.new
    # elsif @step != nil
    #   @step = Step.find(params[:id])
    #   @goal = @step.goal
    #   @steps = @goal.steps
    # elsif Step.exists? == false
    #   @goal = Goal.find(params[:id])
    # else
    #   @goal = Step.find(params[:id]).goal
    #   @steps = @goal.steps
    # end
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
