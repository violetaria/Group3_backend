class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :user

  validates_presence_of :user_id, :card_id, :duration
  validates :correct, :inclusion => { :in => [true, false] }
end
