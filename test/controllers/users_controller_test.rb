require 'test_helper'

class UsersControllerTest  < ActionController::TestCase
  test "new users can register for an account" do
    assert_difference "User.count" do
      post :new, { username: "TestUser1", fullname: "Test User One", email: "TestUser@Test.Com", password: "TestPassword" }
    end

    assert_response :created
  end

  test "new users cannot register with invalid inputs" do
    assert_no_differene "User.count", -1 do
      post :new, { fullname: "Test User One", email: "TestUser@Test.Com", password: "TestPassword" }
    end

    assert_response :unprocessable_entity
  end

  test "registered users can login" do
    post :new, { username: "TestUser1", fullname: "Test User One", email: "TestUser@Test.Com", password: "TestPassword" }

    assert_response :created

    post :create, { username: "TestUser1", password: "TestPassword" }

    assert_response :accepted
  end

  test "non-registered users cannot login" do
    post :create, { username: "NonExistingUser", password: "TestPassword" }

    assert_response :unauthorized
  end
end