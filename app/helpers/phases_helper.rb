# frozen_string_literal: true

module PhasesHelper
  def all_tech_manager
    User.where(user_role: 'TM')
  end

  def all_engineer
    User.where(user_role: 'engineer')
  end
end
