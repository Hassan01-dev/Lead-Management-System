# frozen_string_literal: true

class LeadPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    update?
  end

  def create?
    update?
  end

  def edit?
    update?
  end

  def update?
    if @user
      @user.has_role? :BD
    else
      false
    end
  end

  def destroy?
    update?
  end
end
