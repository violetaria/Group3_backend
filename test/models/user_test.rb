require 'test_helper'
require "pry"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create valid user" do
    user = User.new(username: "user3",
                fullname: "user three",
                email: "user@three.com",
                password: "userthreepassword")

    assert user.save

    assert user.errors.blank?
  end

  test "cannot create user with blank username" do
    user = User.new(fullname: "user three",
                    email: "user@three.com",
                    password: "userthreepassword")

    refute user.save

    assert user.errors.present?
  end

  test "cannot create two users with same username" do
    user1 = User.new(username: "terri",
                     fullname: "terri",
                     email: "test@test.com",
                     password: "userpassword")
    user2 = User.new(username: "terri",
                     fullname: "chu",
                     email: "chu@test.com",
                     password: "userpassword")

    assert_equal user1.username,user2.username

    assert user1.save
    refute user2.save

    assert user2.errors.present?
  end

  test "cannot create user with blank fullname" do
    user = User.new(username: "user3",
                    email: "user@three.com",
                    password: "userthreepassword")

  refute user.save

  assert user.errors.present?
end

  test "cannot create user with blank email" do
    user = User.new(username: "user3",
                    fullname: "user three",
                    password: "userthreepassword")

    refute user.save

    assert user.errors.present?
  end

  test "cannot create user with invalid email" do
     user1 = User.new(username: "user3",
                    fullname: "user three",
                    email: "@three.com",
                    password: "userthreepassword")

     refute user1.save

     assert user1.errors.present?

  end

  test "cannot create user with blank password" do
    user = User.new(username: "user3",
                    fullname: "user three",
                    email: "user@three.com")
    refute user.save

    assert user.errors.present?

  end


end
