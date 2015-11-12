require 'test_helper'

class DeckTest < ActiveSupport::TestCase

 test "can create valid deck" do
   deck = users(:one).decks.new(title: "cats")

   assert deck.save

   assert deck.errors.blank?
  end

  test "cannot create deck with blank user" do
    deck = Deck.new(title: "cats")

    refute deck.save

    assert deck.errors.present?
  end

  test "cannot create deck with blank title" do
    deck = users(:one).decks.new()

    refute deck.save

    assert deck.errors.present?
  end

  test "the same user cannot create two deck with same title" do
    deck1 = users(:one).decks.new(title: "cats")
    deck2 = users(:one).decks.new(title: "cats")

    assert deck1.title == deck2.title
    assert deck1.user.id == deck2.user.id

    assert deck1.save
    refute deck2.save

    assert deck1.errors.blank?
    assert deck2.errors.present?
  end

  test "different users can create two decks with same title" do
    deck1 = users(:one).decks.new(title: "cats")
    deck2 = users(:two).decks.new(title: "cats")

    assert deck1.title == deck2.title
    refute deck1.user.id == deck2.user.id

    assert deck1.save
    assert deck2.save

    assert deck1.errors.blank?
    assert deck2.errors.blank?

  end
end
