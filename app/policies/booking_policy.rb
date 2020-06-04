class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    return new?
  end

  def destroy?
    record.user == user
  end
end
