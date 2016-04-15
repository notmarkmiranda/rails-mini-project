require 'test_helper'

class IdeaCreationTest < ActionDispatch::IntegrationTest
  test "idea can be created" do
    visit ideas_path

    click_link "Create New Idea"

    fill_in "description", with: "Write tests before you write code!"

    click_button "Submit Idea"

    assert page.has_content? "Idea Successfully Created!"
    assert page.has_content? "Write tests before you write code!"
  end

  test "idea will not be created without valid description" do
    visit ideas_path

    click_link "Create New Idea"

    click_button "Submit Idea"
    assert page.has_content? "Description can't be blank!"
  end
end
