class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

end
