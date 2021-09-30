# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_role, null: false, default: 'engineer'
      t.boolean :active, default: 'true'

      t.timestamps
    end
  end
end
