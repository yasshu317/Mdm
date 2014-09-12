class CreateRingtones < ActiveRecord::Migration
  def change
    create_table :ringtones do |t|
      t.string :name
      t.boolean :delete_ring_tone

      t.timestamps
    end
  end
end
