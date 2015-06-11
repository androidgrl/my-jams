require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'it is valid' do
    user = User.new(username: "Jamie",
                    password: "password",
                    role: 1)

    assert user.valid?
  end

  test 'it is invalid without a username' do
    user = User.new(username: "",
                    password: "password",
                    role: 0)

    refute user.valid?
  end

  test 'username is unique' do
    user1 = User.create(username: "Jamie",
                    password: "password",
                    role: 0)
    user2 = User.new(username: "Jamie",
                    password: "password",
                    role: 0)

    refute user2.valid?
  end
end
