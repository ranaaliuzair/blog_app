class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
    length: {
      maximum: 105
    },
    uniqueness: {
     case_sensitive: false
   },
   format: {
    with: VALID_EMAIL_REGEX
  }

  validates :username, presence: true,
    uniqueness: {
      case_sensitive: false
    },
    length: {
      minimum: 3, maximum: 25
    }

  before_save { self.email = email.downcase }

  has_many :comments
  has_many :articles
end
