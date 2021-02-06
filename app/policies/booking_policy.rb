class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.bike_ad.user != user
  end

  def show?
    true
  end

  def destroy?
    record.user == user || record.bike_ad.user == user
  end

  def approve?
    record.bike_ad.user == user
  end
end
