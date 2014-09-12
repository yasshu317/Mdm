class ChangeMobileToMobileUsers < ActiveRecord::Migration
  def change
    change_column :mobile_users, :mobile, :string
  end
end
