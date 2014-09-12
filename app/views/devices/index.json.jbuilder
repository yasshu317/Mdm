json.array!(@devices) do |device|
  json.extract! device, :id, :device_type, :serial_number, :capacity, :mobile_user_id, :version, :supervised
  json.url device_url(device, format: :json)
end
