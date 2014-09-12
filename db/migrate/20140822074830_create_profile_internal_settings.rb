class CreateProfileInternalSettings < ActiveRecord::Migration
  def change
    create_table :profile_internal_settings do |t|
      t.integer :internal_setting_id
      t.integer :profile_id	
    end
  end
end
