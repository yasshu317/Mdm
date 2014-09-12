class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.string :activity
      t.string :status
      t.integer :mobile_user_id

      t.timestamps
    end
  end
end
