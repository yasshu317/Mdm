class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :profile_name
      t.boolean :camera
      t.boolean :set_password
      t.integer :wallpaper_id
      t.boolean :call_recording
      t.boolean :spy_recording
      t.integer :email_access_id
      t.integer :default_call_duration
      t.integer :device_mode
      t.integer :ringtone_id
      t.boolean :access_to_os
      t.boolean :wifi
      t.boolean :gprs
      t.string :timezone
      t.boolean :secure_pictures
      t.integer :internal_setting_id
      t.boolean :status

      t.timestamps
    end
  end
end
