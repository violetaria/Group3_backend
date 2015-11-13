require 'test_helper'

class DecksControllerTest < ActionController::TestCase


  test "logged in users can create new decks" do
    @request.headers["Access-Key"] = users(:one).access_key

    assert_difference "Deck.count" do
      post :create, { title: "Test Deck Title" }
    end

    assert_response :created

    assert_not_nil assigns(:deck)
  end

  test "non logged in users cannot create new decks" do
    assert_no_difference "Deck.count" do
      post :create, { title: "Test Deck Title" }
    end

    assert_response :unauthorized

    refute assigns(:deck)
  end

  test "logged in users can list all decks" do
    @request.headers["Access-Key"] = users(:one).access_key

    get :index, { owner: "all" }

    assert_response :ok

    assert_not_nil assigns(:decks)
  end

  test "non logged in users cannot list all decks" do
    get :index, { owner: "all" }

    assert_response :unauthorized

    refute assigns(:decks)
  end

  test "logged in users can update a deck they created" do
    @request.headers["Access-Key"] = users(:one).access_key

    patch :update, { id: decks(:one).id, title: "New Title!" }

    assert_response :ok
  end

  test "non logged in users cannot update a deck" do
    patch :update, { id: decks(:one).id, title: "New Title!" }

    assert_response :unauthorized
  end

  test "users cannot edit decks they didn't create" do
    @request.headers["Access-Key"] = users(:one).access_key

    patch :update, { id: decks(:two).id, title: "New Title!" }

    assert_response :unauthorized
  end

  test "logged in users can destroy a deck they created" do
    @request.headers["Access-Key"] = users(:one).access_key

    delete :destroy, { id: decks(:one).id }

    assert_response :ok
  end

  test "non logged in users cannot delete a deck" do
    delete :destroy, { id: decks(:one).id }

    assert_response :unauthorized
  end

  test "users cannot delete a deck they didn't create" do
    @request.headers["Access-Key"] = users(:one).access_key

    delete :destroy, { id: decks(:two).id }

    assert_response :unauthorized
  end
end
