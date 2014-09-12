class AddSettingsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :password_length, :integer
    add_column :profiles, :expiry, :string
    add_column :profiles, :password_type, :string
  end
end
