# frozen_string_literal: true

class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.string :phase_type
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :approved, default: false
      t.boolean :is_accepted, default: false
      t.jsonb :assigned_engineer
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :lead, foreign_key: true, index: true

      t.timestamps
    end
  end
end
