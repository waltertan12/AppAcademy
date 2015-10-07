class Api::StepsController < ApplicationController
  def index
    render json: Step.all
  end

  def create
    step = Step.new(step_params)
    if step.save
      render json: step
    else
      render json: step.errors
    end
  end

  def update
    step = Step.find(params[:id])
    if step.update(step_params)
      render json: step
    else
      render json: step.errors
    end
  end

  def destroy
    step = Step.find(params[:id])
    if step.destroy
      render json: step
    else
      render json: step.errors
    end
  end

  private
  def step_params
    params.permit(:todo_id, :stepbody, :step_number)
  end
end
