class Api::TodosController < ApplicationController
  def index
    todos = Todo.all
    render json: todos
  end

  def show
    todo = Todo.find(params[:id])
    if todo
      render json: todo
    else
      render json: "Not Found"
    end 
  end

  def create
    # new_todo = Todo.create(params)
    new_todo = Todo.new(todo_params)
    if new_todo.save
      render json: new_todo
    else
      render json: new_todo.errors
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    if todo.destroy
      render json: todo
    else
      render json: todo.errors
    end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: todo
    else
      render json: todo.errors
    end
  end

  private
  def todo_params
    params.permit(:title, :body, :done)
  end

end
