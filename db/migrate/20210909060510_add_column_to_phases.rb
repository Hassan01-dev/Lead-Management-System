class AddColumnToPhases < ActiveRecord::Migration[5.2]
  def change
    add_column :phases, :assigned_engineer, :jsonb
  end
end
