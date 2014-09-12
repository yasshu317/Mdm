class CreateInternalSettings < ActiveRecord::Migration
  def change
    create_table :internal_settings do |t|
      t.string :name

      t.timestamps
    end
  end
end
