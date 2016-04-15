require 'test_helper'

class IdeaEditingTest < ActionDispatch::IntegrationTest
  test "can update created idea" do
    idea = Idea.create(description: "Write tests after you write code!")

    visit ideas_path
    click_link "Write tests after you write code!"
    click_link "edit"
    fill_in "description", with: "Write tests before you write code!"

    click_button "Submit Idea!"

    assert page.has_content? "Idea Successfully Updated!"
    assert page.has_content? "Write tests before you write code!"
  end

  test "can update idea from index page" do
    idea = Idea.create(description: "Write tests after you write code!")

    visit ideas_path

    click_link("edit", match: :first)
    fill_in "description", with: "Write tests before you write code!"
    click_button "Submit Idea!"

    assert page.has_content? "Idea Successfully Updated!"
    assert page.has_content? "Write tests before you write code!"

  end

  test "will not update if description is blank" do
    idea = Idea.create(description: "Write tests after you write code!")

    visit ideas_path
    click_link "Write tests after you write code!"
    click_link "edit"
    fill_in "description", with: ""

    click_button "Submit Idea!"

    assert page.has_content? "Description can't be blank!"
  end
end
