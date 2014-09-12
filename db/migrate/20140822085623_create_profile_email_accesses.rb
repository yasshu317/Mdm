class CreateProfileEmailAccesses < ActiveRecord::Migration
  def change
    create_table :profile_email_accesses do |t|
    	t.integer :email_access_id
    	t.integer :profile_id
    end
  end
end
