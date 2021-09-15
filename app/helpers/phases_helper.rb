# frozen_string_literal: true

module PhasesHelper
  def all_tech_manager
    User.where(user_role: 'TM')
  end

  def all_engineer
    User.where(user_role: 'engineer')
  end

  def find_all_engineer_of_phase(arr)
    all_id_array = arr.delete_if { |x| x == '' }
    all_id_array.map { |x| User.find(x).user_name }
  end
end
