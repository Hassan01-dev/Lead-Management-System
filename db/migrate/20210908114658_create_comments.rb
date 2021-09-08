# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :comment_text
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :phase, foreign_key: true, index: true

      t.timestamps
    end
  end
end
