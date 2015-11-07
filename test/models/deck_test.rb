require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  self.use_instantiated_fixtures = true

  def test_new_deck_valid
    deck = @userone.decks.new(title: "Brand New Deck")
    assert deck.valid?
    deck.save

    deck = @usertwo.decks.new(title: "Brand New Deck")
    assert deck.valid?
  end

  def test_new_deck_invalid_title
    deck = Deck.new(user_id: 1, title: "Title")
    assert deck.valid?
    deck.save

    invalid_deck = Deck.new(user_id: 1, title: "Title")
    refute invalid_deck.valid?
  end

  # def test_can_delete_deck
  #   @userone.decks.create(title: "Brand New Deck")
  #   assert_equal 1, @userone.decks.count
  #
  #   @userone.decks.destroy(id: 1)
  #   binding.pry
  #   assert_equal 0, @userone.decks.count
  # end
end
