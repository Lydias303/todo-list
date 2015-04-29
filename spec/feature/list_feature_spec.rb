require "rails_helper"

describe "an authenticated user" do
  include Capybara::DSL

  before(:each) do
    visit '/'
  end

  it "can create a list" do
    expect(page).to have_content("Create A New Todo List")

    within(".list-create") do
      fill_in "list[title]", with: "New List"
      click_button "Create List"
    end
    expect(page).to have_content("New List")
  end
end
