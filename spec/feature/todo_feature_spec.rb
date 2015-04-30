require "rails_helper"

describe "an authenticated user" do
  include Capybara::DSL

  before(:each) do
    visit '/'
  end


  it "can create a todo associated with a list" do
    expect(page).to have_content("Create A New Todo List")

    within(".list-create") do
      fill_in "list[title]", with: "New List"
      click_button "Create List"
    end
    expect(page).to have_content("New List")

    within('.bhoechie-tab-menu') do
      first('.list-title-display').click
    end

    within(".input-group-btn") do
      fill_in "new-todo-input", with: "Go to the Store"
      click_button "add-todo"
    end

    sleep 3
    have_css(".list-group-item[data-todo-id='1']")
  end
end
