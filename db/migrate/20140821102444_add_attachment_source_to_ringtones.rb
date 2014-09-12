class AddAttachmentSourceToRingtones < ActiveRecord::Migration
  def self.up
    change_table :ringtones do |t|
      t.attachment :source
    end
  end

  def self.down
    remove_attachment :ringtones, :source
  end
end
