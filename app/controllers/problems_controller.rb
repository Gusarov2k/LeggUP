class ProblemsController < ApplicationController
  before_action :find_problem_id, only: %i[show edit update destroy word_comparison]

  def index
    @problems = Problem.all
  end

  def show; end

  def new
    @problem = Problem.new
  end

  def edit; end

  def create
    @problem = Problem.new(problem_params)

    if @problem.save
      redirect_to problem_path(@problem)
    else
      render :show
    end
  end

  def update
    if @problem.update(problem_params)
      redirect_to @problem
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_path
  end

  private

  def find_problem_id
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, step: [:decision])
  end
end
