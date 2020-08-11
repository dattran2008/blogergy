class User < ActiveRecord::Base
  has_many :article, dependent: :destroy
  has_secure_password
  before_save { self.email = email.downcase }

  validates :username,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 15 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEX }
  validates :name, presence: true
end
