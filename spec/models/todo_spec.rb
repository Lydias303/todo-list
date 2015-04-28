require 'rails_helper'

RSpec.describe Todo, type: :model do
  lydias_todo = Todo.new(todo_item: "Make a todo rails app!",
                         completed: false,
                         priority: true)

  nathans_todo = Todo.new(todo_item: "Wash the car")

  it "is valid" do
    expect(lydias_todo).to be_valid
  end

  it "is not valid without a todo item" do
    lydias_todo.todo_item = ""
    expect(lydias_todo).to be_invalid
  end

  it "has a default completed status of false" do
    expect(nathans_todo.completed).to eq(false)
  end

  it "has a default priority status of false" do
    expect(nathans_todo.priority).to eq(false)
  end
end
