# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.belongs_to :lead, foreign_key: true, index: true
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
