class AddAttachmentAvatarToWallpapers < ActiveRecord::Migration
  def self.up
    change_table :wallpapers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :wallpapers, :avatar
  end
end
