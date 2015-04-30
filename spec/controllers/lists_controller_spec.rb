require 'rails_helper'

RSpec.describe ListsController, :type => :controller do

  it "assigns @lists" do
    get :index
    expect(response).to render_template("index")
  end

  it "can create a list" do
    expect(List.count).to eq(0)
    post :create, list: {title: "My New List"}
    assert_redirected_to root_path
    expect(List.count).to eq(1)
  end

  it "can go to the listings show" do
    list = List.create(title: "New List")

    get :show, id: list.id

    expect(response).to render_template("show")
  end

  it "can delete a list" do
    list = create(:list)

    expect(List.count).to eq(1)

    delete :destroy, id: list.id

    expect(List.count).to eq(0)
  end
end
