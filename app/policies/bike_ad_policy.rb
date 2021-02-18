class BikeAdPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.available
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user && (record.bookings.last.nil? || (record.bookings.last.end_date < Date.today))
  end

  def destroy?
    record.user == user
  end
end
