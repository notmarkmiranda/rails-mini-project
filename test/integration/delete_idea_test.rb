require 'test_helper'

class DeleteIdeaTest < ActionDispatch::IntegrationTest
  test "an idea can be deleted" do
    category = Category.create(name: "Programming")
    category.ideas.create(description: "Write tests before you write code!")
    user = User.create(name: "Mark", email: "Mark@am.com", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit category_path(category)
    first(:link, "delete idea").click

    assert page.has_content? "Idea Successfully Deleted!"
    refute page.has_content? "Write tests before you write code!"
  end
end
