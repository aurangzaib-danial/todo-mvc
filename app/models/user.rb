class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, length: {:within => 6..40}, on: :create
end
