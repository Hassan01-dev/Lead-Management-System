# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :user_email
      t.integer :user_role
      t.text :user_password

      t.timestamps
    end
  end
end
