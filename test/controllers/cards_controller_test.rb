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

    assert_no_difference "Card.count" do
      post :create, { id: decks(:two).id, front: "Cat", back: "Dog" }
    end

    assert_response :not_found

    refute assigns(:card)
  end

  test "logged in users can list cards in a deck" do
    @request.headers["Access-Key"] = users(:one).access_key

    get :index, { id: decks(:one).id }

    assert_response :ok

    assert_not_nil assigns(:deck)
    assert_not_nil assigns(:cards)
  end

  test "non logged in users cannot list cards in a deck" do
    get :index, { id: decks(:one).id }

    assert_response :unauthorized

    refute assigns(:deck)
    refute assigns(:cards)
  end

  test "logged in users can edit cards in a deck they created" do
    @request.headers["Access-Key"] = users(:one).access_key

    put :edit, { id: decks(:one).id, front: "New front", back: "New back" }

    assert_response :ok

    assert_not_nil assigns(:card)
  end

  test "non logged in users cannot edit a card" do
    put :edit, { id: decks(:one).id, front: "New front", back: "New back" }

    assert_response :unauthorized

    refute assigns(:card)
  end

  test "logged in users cannot edit cards in a deck they didn't create" do
    @request.headers["Access-Key"] = users(:one).access_key

    put :edit, { id: decks(:two).id, front: "New front", back: "New back" }

    assert_response :unauthorized

    assert_not_nil assigns(:card)
  end

  test "logged in users can delete cards they created" do
    @request.headers["Access-Key"] = users(:one).access_key

    assert_difference "Card.count", -1 do
      delete :destroy, { id: cards(:one).id }
    end

    assert_response :ok
  end

  test "non logged in users cannot destroy cards they created" do
    assert_no_difference "Card.count" do
      delete :destroy, { id: cards(:one).id }
    end

    assert_response :unauthorized
  end

  test "logged in users cannot delete cards they didn't create" do
    @request.headers["Access-Key"] = users(:one).access_key

    assert_no_difference "Card.count" do
      delete :destroy, { id: cards(:two).id }
    end

    assert_response :unauthorized
  end
end