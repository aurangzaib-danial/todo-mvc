class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i(github google_oauth2 facebook twitter)

  has_many :personal_lists, class_name: 'List', foreign_key: :creator_id, dependent: :destroy
  has_many :collaborator_lists, foreign_key: :collaborator_id, dependent: :destroy
  has_many :shared_lists, through: :collaborator_lists, source: :list

  has_many :identities, dependent: :destroy

  def shared_lists_with_creators
    shared_lists.includes(:creator)
  end

  def self.find_or_create_from_auth_info(auth_info)
    
    find_or_create_by(email: auth_info[:email]) do |user|
      user.password = Devise.friendly_token[0, 20]
    end

  end
end
