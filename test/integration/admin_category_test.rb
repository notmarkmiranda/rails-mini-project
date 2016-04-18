require 'test_helper'

class AdminCategoryTest < ActionDispatch::IntegrationTest
  test "admins have access to categories" do
    admin = User.create(name: "Mark", email: "markmiranda51@gmail.com", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    Category.create(name: "programming")

    visit categories_path
    assert page.has_content? "All Categories"
    assert page.has_content? "programming"
  end

  test "users do not have access to categories" do
    user = User.create(name: "Mark", email: "markmiranda51@gmail.com", password: "password", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    category = Category.create(name: "programming")
    visit category_path(category)

    refute page.has_content? "Edit programming Category"
    refute page.has_content? "Delete programming Category"
    # assert page.has_content? "The page you were looking for doesn't exist."
  end

end
