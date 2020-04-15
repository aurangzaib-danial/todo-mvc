# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, List, creator_id: user.id
    can :read, List do |list|
      list.is_shared_with?(user)
    end
  end
end
