class TodoAction < ActiveRecord::Base
  belongs_to :todo

  def self.pomodoro_status(todo)
    number_of_completed = where(todo: todo, completed:true).count
    amount_per_todo = where(todo: todo).count
    "#{number_of_completed}/#{amount_per_todo} Completed"
  end
end
