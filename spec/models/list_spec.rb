require 'rails_helper'

RSpec.describe List, type: :model do

  it "is valid" do
    list = create(:list)
    expect(list).to be_valid
  end

  it "has a todo item" do
    list = create(:list)
    todo = create(:todo)
    list.todos << todo
    expect("Go grocery shopping").to eq(list.todos.first.todo_item)
  end

  it "is not valid without a title" do
    list = build(:list, title: "")
    expect(list.valid?).to be_falsey
  end
end
