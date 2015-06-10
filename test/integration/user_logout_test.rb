require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test 'user can logout' do
    user = User.create(username: "Jamie", password: "password")

    visit login_path
    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome Jamie!")

    click_link "Logout"

    refute page.has_content?("Welcome Jamie!")
  end
end


