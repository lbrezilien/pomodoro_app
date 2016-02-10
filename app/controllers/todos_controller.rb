class TodosController < ApplicationController
  before_action :authenticate_user!

  def create
     new_todo = Todo.new(todo_params)
     new_todo.user = current_user
     if new_todo.save
       redirect_to current_user
     end
  end

  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      redirect_to current_user
    end
  end

  def destroy
    Todo.destroy(params[:id])
    redirect_to current_user
  end

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
