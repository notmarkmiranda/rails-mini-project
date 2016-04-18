require 'test_helper'

class CategoryEditTestTest < ActionDispatch::IntegrationTest
  test "created category can be edited" do
    admin = User.create(name: "Mark", email: "markmiranda51@gmail.com", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    Category.create(name: "Programing")

    visit categories_path
    click_link "Edit Programing Category"
    fill_in "name", with: "Programming"
    click_button "Submit Category"

    assert page.has_content? "Category Successfully Updated!"
    assert page.has_content? "Programming"
  end

  test "created category cannot be edited with invalid attributes" do
    admin = User.create(name: "Mark", email: "markmiranda51@gmail.com", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    Category.create(name: "Programing")

    visit categories_path
    click_link "Edit Programing Category"
    fill_in "name", with: ""
    click_button "Submit Category"

    assert page.has_content? "Name can't be blank!"
  end

end
