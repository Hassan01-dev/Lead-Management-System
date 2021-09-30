# frozen_string_literal: true

class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    if @user
      (@user.has_role? :BD) || (@record.is_accepted && (@user == @record.user) || @record.assigned_engineer?(@user))
    else
      false
    end
  end

  def create?
    if @user
      @user == @record.user || @record.assigned_engineer?(@user) || (@user.has_role? :BD)
    else
      false
    end
  end

  def edit?
    update?
  end

  def update?
    if @user
      @user.has_role? :engineer
    else
      false
    end
  end

  def destroy?
    update?
  end
end
