require 'rails_helper'

RSpec.describe TodosController, :type => :controller do

  it "can create a todo on a list" do
    list = create(:list)
    post :create, todo: { list_id: list.id, todo_item: "Do dishes" }

    assert_redirected_to root_path
    expect(list.todos.count).to eq(1)
  end
end
