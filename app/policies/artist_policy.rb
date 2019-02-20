class ArtistPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user == user.admin
  end

  def update?
    record.user == user.admin
  end

  def destroy?
    record.user == user.admin
  end
end
