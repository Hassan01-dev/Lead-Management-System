# frozen_string_literal: true

class CreateUsersPhases < ActiveRecord::Migration[5.2]
  def change
    create_table :users_phases, id: false do |t| # rubocop:disable Rails/CreateTableWithTimestamps
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :phase, foreign_key: true, index: true
    end
  end
end
