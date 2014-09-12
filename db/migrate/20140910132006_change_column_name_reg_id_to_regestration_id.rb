class ChangeColumnNameRegIdToRegestrationId < ActiveRecord::Migration
  def change
  	rename_column :mobile_users, :reg_id, :registration_id
  end
end
