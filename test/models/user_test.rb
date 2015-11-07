require 'test_helper'
require "pry"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_new_valid_user
    user = User.new(username: "user3",
                fullname: "user three",
                email: "user@three.com",
                password: "userthreepassword")

    assert user.valid?
  end

  def test_new_user_no_username
    user = User.new(fullname: "user three",
                    email: "user@three.com",
                    password: "userthreepassword")

    refute user.valid?
  end

  def test_new_user_invalid_username
    user = User.new(username: "user1",
                     fullname: "user",
                     email: "user@user.com",
                     password: "userpassword")
    refute user.valid?
  end

  def test_new_user_no_fullname
    user = User.new(username: "user3",
                    email: "user@three.com",
                    password: "userthreepassword")

    refute user.valid?
  end

  def test_new_user_no_email
    user = User.new(username: "user3",
                    fullname: "user three",
                    password: "userthreepassword")

    refute user.valid?
  end

  def test_new_user_invalid_email
     user = User.new(username: "user3",
                    fullname: "user three",
                    email: "@three.com",
                    password: "userthreepassword")

    refute user.valid?

    user = User.new(username: "user3",
                    fullname: "user three",
                    email: "user@one.com",
                    password: "userthreepassword")
     refute user.valid?
  end

  def test_new_user_no_password
    user = User.new(username: "user3",
                    fullname: "user three",
                    email: "user@three.com")
    refute user.valid?
  end


end
