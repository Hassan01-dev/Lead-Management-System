# frozen_string_literal: true

class AddColumnsToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :client_name, :string # rubocop:disable Rails/BulkChangeTable
    add_column :leads, :client_address, :string
    add_column :leads, :client_email, :string
    add_column :leads, :client_contact, :string
  end
end
