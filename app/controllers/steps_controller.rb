class StepsController < ApplicationController
  before_action :find_problem, only: %i[create destroy]

  def create
    @step = @problem.steps.new(step_params)
    if @step.save
      redirect_to problem_path(@problem)
    else
      render 'problems/show'
    end
  end

  def destroy
    @step = @problem.steps.find(params[:id])
    @step.destroy
    redirect_to problem_path(@problem)
  end

  private

  def find_problem
    @problem = Problem.find(params[:problem_id])
  end

  def step_params
    params.require(:step).permit(:decision)
  end
end
