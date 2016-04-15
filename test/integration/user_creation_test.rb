require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "visitor can create an account with valid attributes" do
    visit root_path

    click_on "Register Account"

    fill_in "name", with: "Mark"
    fill_in "email", with: "markmiranda51@gmail.com"
    fill_in "password", with: "password"

    click_on "Create Account"

    assert page.has_content? "Welcome, Mark!"
    assert page.has_content? "Account Successfully Created!"
  end

  test "visitor cannot create account with invalid attributes" do
    visit root_path

    click_on "Register Account"

    fill_in "name", with: "Mark"
    fill_in "password", with: "password"

    click_on "Create Account"
    assert page.has_content? "Email can't be blank!"
  end
end
