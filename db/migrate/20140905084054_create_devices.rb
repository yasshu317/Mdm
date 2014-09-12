class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :device_type
      t.string :serial_number
      t.string :capacity
      t.integer :mobile_user_id
      t.string :version
      t.string :supervised

      t.timestamps
    end
  end
end
