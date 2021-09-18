class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    if @user
      @user.has_role? :admin
    else
      false
    end
  end

  def new?
    index?
  end

  def create?
    index?
  end
end
