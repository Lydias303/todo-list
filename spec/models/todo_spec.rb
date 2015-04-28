require 'rails_helper'

RSpec.describe Todo, type: :model do
  test_todo = Todo.new(todo_item: "Make a todo rails app!",
                       completed: false,
                       priority: true)

  it "is valid" do
    expect(test_todo).to be_valid
  end

  it "is not valid without a todo item" do
    test_todo.todo_item = ""
    expect(test_todo).to be_invalid
  end
end
