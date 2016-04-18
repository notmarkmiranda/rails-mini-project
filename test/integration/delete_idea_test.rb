require 'test_helper'

class DeleteIdeaTest < ActionDispatch::IntegrationTest
  test "an idea can be deleted" do
    category = Category.create(name: "Programming")
    category.ideas.create(description: "Write tests before you write code!")

    visit category_path(category)
    first(:link, "delete idea").click

    assert page.has_content? "Idea Successfully Deleted!"
    refute page.has_content? "Write tests before you write code!"
  end
end
