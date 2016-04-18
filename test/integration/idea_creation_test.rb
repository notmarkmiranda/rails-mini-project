require 'test_helper'

class IdeaCreationTest < ActionDispatch::IntegrationTest
  test "idea can be created with valid attributes" do
    Category.create(name: "Programming")
    user = User.create(name: "Mark", email: "Mark@am.com", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit categories_path
    click_link "Create Programming Idea"

    fill_in "description", with: "Write tests before you write code!"
    click_button "Submit Idea"

    assert page.has_content? "Idea Successfully Created!"
    assert page.has_content? "Write tests before you write code!"
  end

  test "idea cannot be created with invalid attributes" do
    Category.create(name: "Programming")

    visit categories_path

    click_link "Create Programming Idea"

    fill_in "description", with: ""
    click_button "Submit Idea"

    assert page.has_content? "Description can't be blank!"
  end
end
