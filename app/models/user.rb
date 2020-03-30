class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, length: {:within => 6..40}, on: :create

  has_many :lists, dependent: :destroy

  class << self
    def find_or_create_from_auth_hash(auth_hash)
      email = auth_hash[:info][:email]

      find_or_create_by(email: email) do |user|
        user.password = SecureRandom.hex
      end
    end
  end
end
