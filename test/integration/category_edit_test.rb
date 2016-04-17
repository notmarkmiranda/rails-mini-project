require 'test_helper'

class CategoryEditTestTest < ActionDispatch::IntegrationTest
  test "created category can be edited" do
    cat = Category.create(name: "Programing")

    visit categories_path
    save_and_open_page
    click_link "Edit Programing Category"

    fill_in "name", with: "Programming"
    click_button "Submit Category"

    assert page.has_content? "Category Successfully Updated!"
    assert page.has_content? "Programming"
  end
end
