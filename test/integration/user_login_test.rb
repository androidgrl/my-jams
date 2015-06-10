require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'user can login' do
    user = User.create(username: "Jamie", password: "password")

    visit login_path
    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome Jamie!")

    reset_session!
  end
end


