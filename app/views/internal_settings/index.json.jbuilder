json.array!(@internal_settings) do |internal_setting|
  json.extract! internal_setting, :id, :name
  json.url internal_setting_url(internal_setting, format: :json)
end
