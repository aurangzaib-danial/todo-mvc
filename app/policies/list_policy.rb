class ListPolicy < ApplicationPolicy
  
  def destroy?
    user.id == record.creator_id
  end

  def show?
    destroy? || record.shared_with?(user)
  end

  alias_method :sharing?, :destroy?

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
