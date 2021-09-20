# frozen_string_literal: true

class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :lead_name, null: false
      t.string :lead_type, null: false
      t.string :platform_used
      t.boolean :is_sale, default: false
      t.string :client_name
      t.string :client_address
      t.string :client_email, null: false
      t.string :client_contact
      t.belongs_to :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
