json.array!(@wallpapers) do |wallpaper|
  json.extract! wallpaper, :id, :name, :delete_wallpaper
  json.url wallpaper_url(wallpaper, format: :json)
end
