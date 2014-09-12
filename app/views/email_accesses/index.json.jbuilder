json.array!(@email_accesses) do |email_access|
  json.extract! email_access, :id, :mail_server, :identifier
  json.url email_access_url(email_access, format: :json)
end
