json.array!(@urls) do |url|
  json.extract! url, :id, :title, :url
  json.url url_url(url, format: :json)
end
