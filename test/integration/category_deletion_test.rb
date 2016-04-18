require 'test_helper'

class CategoryDeletionTest < ActionDispatch::IntegrationTest
  test "category can be deleted" do
    Category.create(name: "Web Stuff")

    visit categories_path
    click_link "Delete Web Stuff Category"

    assert page.has_content? "Category Successfully Deleted!"
    refute page.has_content? "Web Stuff"
  end
end
