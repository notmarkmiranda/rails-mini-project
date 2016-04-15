require 'test_helper'

class IdeaDeletionTest < ActionDispatch::IntegrationTest
  test "idea can be deleted from show page" do
    idea = Idea.create(description: "Write tests before you write code!")

    visit idea_path(idea)
    click_link "delete"

    assert page.has_content? "Idea Successfully Deleted!"
    refute page.has_content? "Write tests before you write code!"
  end

  test "idea can be deleted from the index page" do
    idea = Idea.create(description: "Write tests before you write code!")
    visit ideas_path
    click_link("delete", match: :first)
    
  end
end
