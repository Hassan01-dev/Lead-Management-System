# frozen_string_literal: true

class PhasePolicy < ApplicationPolicy
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

  def add_engineer_to_phase?
    remove_engineer_from_phase?
  end

  def remove_engineer_from_phase?
    if @user
      (@user.has_role? :BD) || @record.user == @user
    else
      false
    end
  end
end
