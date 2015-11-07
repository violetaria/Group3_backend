require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  def test_new_deck_valid
    deck = @userone.decks.new(title: "Brand New Deck")

    assert deck.valid?
  end

  def test_new_deck_invalid_title
    #deck = @userone.decks.new(title: "Test Deck 1")

    #binding.pry
    #refute deck.valid?
  end
end
