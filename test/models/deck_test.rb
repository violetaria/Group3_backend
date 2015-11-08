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
    invalid_deck = @userone.decks.new(user_id: 1, title: "Test Deck 1")
    refute invalid_deck.valid?
  end

  def test_can_delete_deck
    original_count = @userone.decks.count
    deck = @userone.decks.create(title: "Brand New Deck")
    assert_equal (original_count + 1), @userone.decks.count

    @userone.decks.destroy(deck)
    assert_equal original_count, @userone.decks.count
  end

  def test_can_edit_deck
    original_title = @deckone.title
    @deckone.update(title: "New Title")
    refute_equal original_title, @deckone.title
  end
end
