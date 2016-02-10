class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @todo = Todo.new
    @todo_action = TodoAction.new
    @todos = @user.todos.all
  end
end
