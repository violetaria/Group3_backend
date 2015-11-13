require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create card with valid inputs" do
    card = decks(:one).cards.new(front: "Test Front", back: "Test Back")

    assert card.save

    assert card.errors.blank?
  end

  test "cannot create card with blank front" do
    card = decks(:one).cards.new(back: "Test Back")

    refute card.save

    assert card.errors.present?
  end

  test "cannot create card with blank back" do
    card = decks(:one).cards.new(front: "Test Front")

    refute card.save

    assert card.errors.present?
  end

  test "cannot create cards with same front and back in a deck" do
    card1 = decks(:one).cards.new(front: "Front", back: "Back")
    card2 = decks(:one).cards.new(front: "Front", back: "Back")

    assert card1.save
    assert card1.errors.blank?

    refute card2.save
    assert card2.errors.present?
  end

  test "can create cards with same front and back in two decks" do
    card1 = decks(:one).cards.new(front: "Front", back: "Back")
    card2 = decks(:two).cards.new(front: "Front", back: "Back")

    assert card1.save
    assert card1.errors.blank?

    assert card2.save
    assert card2.errors.blank?
  end
end
