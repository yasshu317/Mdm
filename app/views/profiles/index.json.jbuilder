json.array!(@profiles) do |profile|
  json.extract! profile, :id, :profile_name, :camera, :set_password, :wallpaper_id, :call_recording, :spy_recording, :email_access_id, :default_call_duration, :device_mode, :ringtone_id, :access_to_os, :wifi, :gprs, :timezone, :secure_pictures, :internal_setting_id, :status
  json.url profile_url(profile, format: :json)
end
