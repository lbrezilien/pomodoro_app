class CreateTodoActions < ActiveRecord::Migration
  def change
    create_table :todo_actions do |t|
      t.integer :todo_id
      t.string :name
      t.boolean :completed, default: false
      t.timestamps null: false
    end
  end

end
