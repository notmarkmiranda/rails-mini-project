require 'test_helper'

class IdeaEditTest < ActionDispatch::IntegrationTest
  test "created idea can be edited" do
    category = Category.create(name: "Programming")

    idea = category.ideas.create(description: "Write tests after you write code?")
    user = User.create(name: "Mark", email: "Mark@am.com", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)


    visit category_path(category.id)
    first(:link, "edit idea").click

    fill_in "description", with: "Write tests before you write code!"
    click_button "Submit Idea"

    assert page.has_content? "Idea Successfully Updated!"
    assert page.has_content? "Write tests before you write code!"
  end

  test "created idea cannot be edited with invalid attributes" do
    category = Category.create(name: "Programming")
    idea = category.ideas.create(description: "Write tests after you write code?")
    user = User.create(name: "Mark", email: "Mark@am.com", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit category_path(category.id)
    first(:link, "edit idea").click

    fill_in "description", with: ""
    click_button "Submit Idea"

    assert page.has_content? "Description can't be blank"
    refute page.has_content? "Write tests before you write code!"
  end
end
