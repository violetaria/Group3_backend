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

end
