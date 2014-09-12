json.array!(@activity_logs) do |activity_log|
  json.extract! activity_log, :id, :activity, :status, :mobile_user_id
  json.url activity_log_url(activity_log, format: :json)
end
