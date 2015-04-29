require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  it "can create a todo on a list" do
    list = create(:list)
    post :create, todo: { list: list.id, text: "Do dishes" }

    assert_redirected_to root_path
    expect(list.todos.count).to eq(1)
  end

  it "can delete a todo on a list" do
    todo = create(:todo)
    expect(Todo.count).to eq(1)
    delete :destroy, id: todo.id

    assert_redirected_to root_path
    expect(Todo.count).to eq(0)
  end
end
