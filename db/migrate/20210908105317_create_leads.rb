# frozen_string_literal: true

class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :lead_name
      t.string :lead_type
      t.string :platform_used
      t.boolean :is_sale
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :client, foreign_key: true, index: true

      t.timestamps
    end
  end
end
