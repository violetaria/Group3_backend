class Card < ActiveRecord::Base
  has_many :guesses
  has_many :users, through: :guesses

  belongs_to :deck
    # deck is singular, "decks" would be the table, assume that cards table has a "deck_id" column
    # now write a "deck" method that lets you get the deck for a specific card
  validates_presence_of :deck_id, :front, :back
  validates_uniqueness_of :front, :back, :scope => :deck_id
end
