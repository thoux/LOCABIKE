class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.has_bike_ads
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def my_profil?
    record == user
  end

end
