class TodoActionsController < ApplicationController

  before_action :authenticate_user!

   def create
    @todo_action = TodoAction.create(action_params)
    redirect_to current_user
    # @todo_action_partial = render_to_string(partial: 'todo_actions/todo_action_row.html.erb', locals: {todo:  @todo_action})
    # render :json => {todo_action: @todo_action_partial}
   end

   def update
     binding.pry
   end

   def destroy
       TodoAction.destroy(params[:id])
       redirect_to current_user
   end

   def mark_complete
     TodoAction.update(params[:id], completed: true)
     render nothing: true
   end

   private
   def action_params
     params.require(:todo_action).permit(:name, :todo_id)
   end
end
