class RemoveClientIdFromLead < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :client_id, :string
  end
end
