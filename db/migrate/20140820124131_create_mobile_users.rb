class CreateMobileUsers < ActiveRecord::Migration
  def change
    create_table :mobile_users do |t|
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :gender
      t.integer :employee_id
      t.integer :mobile
      t.integer :group_id

      t.timestamps
    end
  end
end
