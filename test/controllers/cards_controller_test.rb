require 'test_helper'

class CardsControllerTest < ActionController::TestCase

  test "logged in users can create new cards in decks they created" do
    @request.headers["Access-Key"] = users(:one).access_key

    assert_difference "Card.count" do
      post :create, { id: decks(:one).id, front: "Cat", back: "Dog" }
    end

    assert_response :created

    assert_not_nil assigns(:card)
  end

  test "non logged in users cannot create new cards" do
    assert_no_difference "Card.count" do
      post :create, { id: decks(:one).id, front: "Cat", back: "Dog" }
    end

    assert_response :unauthorized

    refute assigns(:card)
  end

  test "users cannot create cards on decks they did not create" do
    @request.headers["Access-Key"] = users(:one).access_key

    assert_difference "Card.count" do
      post :create, { id: decks(:two).id, front: "Cat", back: "Dog" }
    end

    assert_response :created

    refute assigns(:card)
  end
end