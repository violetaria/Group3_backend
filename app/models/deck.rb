class Deck < ActiveRecord::Base
  before_validation :ensure_access_key!

  validates_presence_of :title

end
