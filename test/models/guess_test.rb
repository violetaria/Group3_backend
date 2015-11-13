require 'test_helper'

class GuessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create valid guess" do
    guess = Guess.new(user_id: users(:one).id,
                      card_id: cards(:one).id,
                      duration: 5,
                      correct: false)

    assert guess.save

    assert guess.errors.blank?
  end

  test "cannot create guess with blank user" do
    guess = Guess.new(card_id: cards(:one).id,
                      duration: 5,
                      correct: false)

    refute guess.save

    assert guess.errors.present?
  end

  test "cannot create guess with blank card" do
    guess = Guess.new(user_id: users(:one).id,
                      duration: 5,
                      correct: false)

    refute guess.save

    assert guess.errors.present?
  end

  test "cannot create guess with blank duration" do
    guess = Guess.new(card_id: cards(:one).id,
                      user_id: users(:one).id,
                      correct: false)

    refute guess.save

    assert guess.errors.present?
  end

  test "cannot create guess with blank correct" do
    guess = Guess.new(card_id: cards(:one).id,
                      duration: 5,
                      user_id: users(:one).id)

    refute guess.save

    assert guess.errors.present?
  end

end
