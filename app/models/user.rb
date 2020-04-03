class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  devise :omniauthable, omniauth_providers: %i(github google_oauth2 facebook)

  has_many :lists, dependent: :destroy

  has_many :identities, dependent: :destroy

  def self.find_or_create_from_auth_info(auth_info)
    
    find_or_create_by(email: auth_info[:email]) do |user|
      user.password = Devise.friendly_token
    end

  end
end
