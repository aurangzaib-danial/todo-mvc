class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :rememberable, :validatable

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
