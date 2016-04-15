require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
  test "logged in user can log out" do
    user = User.create(name: "Mark", email: "markmiranda51@gmail.com", password: "password")

    visit root_path
    click_on "Log In"
    fill_in "email", with: user.email
    fill_in "password", with: "password"

    click_button "Log In"

    click_link "Log Out"

    assert page.has_content? "Successfully Logged Out!"
    assert page.has_link? "Log In"
  end
end
