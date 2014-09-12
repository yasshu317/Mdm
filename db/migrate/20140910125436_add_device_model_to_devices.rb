class AddDeviceModelToDevices < ActiveRecord::Migration
  def change
  	add_column :devices, :device_model, :string
  end
end
