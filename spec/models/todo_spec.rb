require 'rails_helper'

RSpec.describe Todo, type: :model do

  it "is valid" do
    todo = create(:todo)
    expect(todo).to be_valid
  end

  it "is not valid without a todo item" do
    todo = build(:todo, todo_item: "")
    expect(todo.valid?).to be_falsey
  end

  it "has a default completed status of false" do
    todo = create(:todo)
    expect(todo.completed).to eq(false)
  end

  it "has a default priority status of false" do
    todo = create(:todo)
    expect(todo.priority).to eq(false)
  end

  it "belongs to a list" do
    todo = create(:todo)
    list = create(:list)
    list.todos << todo
    expect(todo.list_id).to eq(list.id)
  end
end
