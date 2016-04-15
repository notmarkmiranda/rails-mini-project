require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(name: "Mark", email: "markmiranda51@gmail.com", password: "password")

    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: "password"

    click_on "Login"
    assert page.has_content? "Successfully Logged In!"
    assert page.has_content? "Welcome, Mark!"
  end
end
