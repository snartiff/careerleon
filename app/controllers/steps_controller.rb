class StepsController < ApplicationController
    before_action :authenticate_user!

    def index
      @goal = Goal.find(params[:goal_id])
      @steps = Step.all
      redirect_to @goal
    end

    def show
      @goal = Goal.find(params[:goal_id])
      @step = Step.find(params[:id])
    end

    def new
      @step = Step.new
      @goal = Goal.find(params[:goal_id])
    end

    def create
      @goal = Goal.find(params[:goal_id])
      @step = Step.new(step_params)
      @step.goal = @goal
      @step.user_id = current_user.id
      if @step.save
        redirect_to goal_path(@goal)
        flash[:success] = "Hooray #{current_user.first_name}! You created a new step!"
      else
        @step.errors.any?
        flash[:error] =  @step.errors.full_messages.join(", ")
        render :new
      end
    end

    protected

    def step_params
      params.require(:step).permit(:description, :deadline)
    end
end
