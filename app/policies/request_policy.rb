class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    record.user != user.admin
  end

  def update?
    record.artist.user == user
  end

  def destroy?
    record.artist.user == user
  end
end
