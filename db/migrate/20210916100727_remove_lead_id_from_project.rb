class RemoveLeadIdFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_reference :projects, :lead, foreign_key: true
  end
end
