class CreateWallpapers < ActiveRecord::Migration
  def change
    create_table :wallpapers do |t|
      t.string :name
      t.boolean :delete_wallpaper

      t.timestamps
    end
  end
end
