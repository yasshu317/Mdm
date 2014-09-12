class CreateEmailAccesses < ActiveRecord::Migration
  def change
    create_table :email_accesses do |t|
      t.string :mail_server
      t.string :identifier

      t.timestamps
    end
  end
end
