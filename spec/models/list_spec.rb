require 'rails_helper'

RSpec.describe List, type: :model do

  lydias_list = List.create(title: "New List")

  lydias_todo = Todo.create(todo_item: "Make a todo rails app!",
                            list_id: lydias_list.id)
  it "is valid" do
    expect(lydias_list).to be_valid
  end

  it "has a todo item" do
    item = lydias_list.todos.first
    expect("Make a todo rails app!").to eq(item.todo_item)
  end

  it "is not valid without a title" do
    lydias_list.title = ""
    expect(lydias_list).to be_invalid
  end
end
