class AddRegidToMobileUsers < ActiveRecord::Migration
  def change
    add_column :mobile_users, :reg_id, :string
  end
end
