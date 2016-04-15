require 'test_helper'

class IdeaEditingTest < ActionDispatch::IntegrationTest
  test "can update edit created idea" do
    idea = Idea.create(description: "Write tests after you write code!")

    visit ideas_path
    click_link "Write tests after you write code!"
    click_link "edit"
    fill_in "description", with: "Write tests before you write code!"

    click_button "Submit Idea!"

    assert page.has_content? "Idea Successfully Updated!"
    assert page.has_content? "Write tests before you write code!"
  end
end
