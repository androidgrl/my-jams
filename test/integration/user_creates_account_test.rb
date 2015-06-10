require 'test_helper'

class UserCreatesAccountTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test 'user can create account' do
    visit new_user_path
    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome Jamie!")

    reset_session!
  end
end


