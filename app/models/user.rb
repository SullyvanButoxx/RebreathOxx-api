class User < ApplicationRecord
  # encrypt password
  has_secure_password

  # Validations
  validates_presence_of :firstname, :lastname, :login, :email, :password_digest
  validates :email, :login, uniqueness: true
end
