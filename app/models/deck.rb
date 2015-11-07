class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :stars
  has_many :users, through: :stars

  validates_presence_of :title, :user_id
  validates_uniqueness_of :title, :scope => :user_id
end
