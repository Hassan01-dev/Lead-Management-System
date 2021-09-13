class RemoveUserRoleFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :user_role, :integer
  end
end
