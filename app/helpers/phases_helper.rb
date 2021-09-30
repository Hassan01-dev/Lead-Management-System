# frozen_string_literal: true

module PhasesHelper
  def all_tech_manager
    User.where(user_role: 'TM', active: true)
  end

  def all_engineer
    User.where(user_role: 'engineer', active: true)
  end

  def find_all_engineer_of_phase(arr)
    all_id_array = arr.delete_if { |x| x == '' }
    all_id_array.map { |x| User.find(x).user_name }
  end

  def check_add_engineer(phase, _user)
    if phase.approved
      false
    else
      phase.is_accepted && (current_user == phase.user) || BD?
    end
  end
end
