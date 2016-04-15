require 'test_helper'

class CategoryCreationTest < ActionDispatch::IntegrationTest
  test "category can be created with valid attributes" do
    visit root_path

    click_link "Create New Category"
    fill_in "name", with: "Programming"
    click_button "Create Category"

    assert page.has_content? "Category Successfully Created!"
    assert page.has_content? "Programming"
  end

  test "category cannot be created with invalid attributes" do
    visit root_path

    click_link "Create New Category"
    click_button "Create Category"

    assert page.has_content? "Name can't be blank!"
  end
end
