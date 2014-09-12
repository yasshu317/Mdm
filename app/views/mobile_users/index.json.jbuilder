json.array!(@mobile_users) do |mobile_user|
  json.extract! mobile_user, :id, :user_name, :password, :first_name, :last_name, :dob, :gender, :employee_id, :mobile, :group_id
  json.url mobile_user_url(mobile_user, format: :json)
end
