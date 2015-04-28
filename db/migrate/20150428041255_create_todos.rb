class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string  "todo_item"
      t.boolean "completed", default: "false"
      t.boolean "priority", default: "false"

      t.timestamps null: false
    end
  end
end
