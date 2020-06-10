class SpherePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def edit?
    record.user == user
  end

  def create?
    return new?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
