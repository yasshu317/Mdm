json.array!(@ringtones) do |ringtone|
  json.extract! ringtone, :id, :name, :delete_ring_tone
  json.url ringtone_url(ringtone, format: :json)
end
