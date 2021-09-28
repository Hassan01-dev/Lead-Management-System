# frozen_string_literal: true

module UsersHelper
  def admin?
    current_user.has_role? :admin
  end

  def BD? # rubocop:disable Naming/MethodName
    current_user.has_role? :BD
  end
end
