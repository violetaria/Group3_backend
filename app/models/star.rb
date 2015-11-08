class Star < ActiveRecord::Base
  belongs_to :deck
  belongs_to :user

  validates_presence_of :deck_id, :user_id
  validates_uniqueness_of :deck_id, :scope => :user_id
end
