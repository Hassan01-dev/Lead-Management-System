# frozen_string_literal: true

class CreatePhases < ActiveRecord::Migration[5.2]
  def change
    create_table :phases do |t|
      t.string :phase_type
      t.date :start_date
      t.date :end_date
      t.boolean :approved
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :lead, foreign_key: true, index: true

      t.timestamps
    end
  end
end
