class User < ActiveRecord::Base
  has_secure_password
  has_many :decks

  before_validation :ensure_access_key!

  validates_presence_of :username
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /.+@.+\..+/
  validates :access_key, presence: true, uniqueness: true

  def ensure_access_key!
     if self.access_key.blank?
       self.access_key = User.generate_key
     end
  end

  def self.generate_key
    key = SecureRandom.hex
    while User.exists?(access_key: key)
      key = SecureRandom.hex
    end
    key
  end
end
